module SimpleEditable
  class InlineText < ActiveRecord::Base
    self.primary_key = :key
    validates :key, :text, presence: true
  end
end
