require 'rails_helper'

module SimpleEditable
  RSpec.describe InlineText, :type => :model do
    it "should create inline_text" do
      text = InlineText.create!(key: 'title', text: 'Hello, this is title')
      text.should be_valid
    end
  end
end
