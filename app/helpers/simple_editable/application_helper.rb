module SimpleEditable
  module ApplicationHelper
    # Helper method for inline editing
    # Example of Usage:
    #  = inline_text(:div, 'pages.home.title', 'Hello World', class: 'hello-class another-class', position: 'right')
    # Allowed values for :position in %w(left, right, top, bottom)
    def inline_text(tag, key, default_value, options = {})
      @storage ||= InlineTextStorage.new
      if simple_editable_admin_user.present?
        opts = {
          'contenteditable' => 'true',
          'object'          => 'false',
          'data-text-only'  => options[:text_only],
          'data-pk'         => key,
          'data-url'        => simple_editable.update_inline_text_path,
          'class'           => options[:class]
        }

        opts['data-placement'] = options[:position] if options[:position]

        content_tag(tag, opts) do
          raw(@storage.find_or_create(key, default_value))
        end
      else
        content_tag(tag, class: "#{options[:class]}") do
          raw(@storage.find_or_create(key, default_value))
        end
      end
    end

    def inline_object(tag, object, attribute, options = {})
      if simple_editable_admin_user.present?
        opts = {
          'contenteditable' => 'true',
          'object'          => 'true',
          'data-attribute'  => attribute,
          'data-id'         => object.id,
          'data-class'      => object.class.to_s,
          'data-url'        => simple_editable.update_inline_object_path,
          'class'           => options[:class],
          'data-text-only'  => options[:text_only],
        }

        opts['data-placement'] = options[:position] if options[:position]

        content_tag(tag, opts) do
          raw(object.send(attribute))
        end
      else
        content_tag(tag, class: "#{options[:class]}") do
          raw(object.send(attribute))
        end
      end
    end

    def simple_editable_admin_user
      SimpleEditable.admin_user ? send(SimpleEditable.admin_user) : true
    end
  end
end
