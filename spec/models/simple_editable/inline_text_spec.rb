require 'rails_helper'

module SimpleEditable
  RSpec.describe InlineText, type: :model do
    it 'should create inline_text' do
      text = InlineText.create!(key: 'title', text: 'Hello, this is title')
      expect(text).to be_valid
    end
  end
end
