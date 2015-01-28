module SimpleEditable
  class InlineText < ActiveRecord::Base
    self.table_name = 'simple_editable_inline_texts'
    self.primary_key = :key
    validates :key, :text, presence: true
  end
end
