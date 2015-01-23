module SimpleEditable
  class InlineTextStorage
    TIMESTAMP_KEY = 'inline_texts_timestamp'
    TEXTS_KEY = 'inline_texts'
    @@timestamp = nil
    @@texts = {}

    def initialize
      if expired?
        read_all
      else
        data = Rails.cache.read(TEXTS_KEY)
        @@texts = data.nil? ? {} : Marshal.load(data)
      end
    end

    def read_all
      @@texts = InlineText.all.inject({}) do |result, inline_text|
        result[inline_text.key] = inline_text.text
        result
      end
      update_cache
    end

    # drops entire database for inline texts
    def drop_all
      InlineText.delete_all
      Rails.cache.write(TIMESTAMP_KEY, nil)
      Rails.cache.write(TEXTS_KEY, nil)
    end

    def find_or_create(key, text)
      if !@@texts.has_key?(key)
        inline_text = InlineText.find_by_key(key)
        if inline_text.nil?
          InlineText.create(key: key, text: text)
        else
          inline_text.text = text
          inline_text.save
        end
        @@texts[key] = text
        update_cache
        @@texts[key]
      else
        @@texts[key]
      end
    end

    def update(key, value)
      inline_text = InlineText.find_by_key!(key)
      inline_text.text = value
      inline_text.save
      @@texts[key] = value
      update_cache
    end

    private

    def update_cache
      Rails.cache.write(TEXTS_KEY, Marshal.dump(@@texts))
      @@timestamp = Time.now.to_i
      Rails.cache.write(TIMESTAMP_KEY, @@timestamp)
    end

    def expired?
      timestamp = Rails.cache.read(TIMESTAMP_KEY)
      @@timestamp != timestamp
    end
  end
end
