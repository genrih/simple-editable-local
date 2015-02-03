require 'rails_helper'

module SimpleEditable
  RSpec.describe SimpleEditable::ApplicationHelper, type: :helper do
    describe 'inline_text' do
      it 'render inline editable tag' do
        s_tag = helper.inline_text(:p, 'paragraph', 'This is paragraph', text_only: true, class: 'paragraph')
        %w(contenteditable=\"true\" object=\"false\" data-text-only=\"true\" data-url=\"\/simple_editable\/update_inline_text\" class=\"paragraph\" This is paragraph).each do |pattern|
          expect(s_tag).to match /#{pattern}/
        end
      end
    end

    describe 'inline_object' do
      it 'render inline editable tag' do
        obj = InlineText.create!(key: 'test_title', text: 'Hello, this is title')
        s_tag = inline_object(:p, obj, :text, class: 'text')
        %w(contenteditable=\"true\" object=\"true\" data-url=\"\/simple_editable\/update_inline_object\" class=\"text\" data-attribute="text").each do |pattern|
          expect(s_tag).to match /#{pattern}/
        end
      end
    end
  end
end
