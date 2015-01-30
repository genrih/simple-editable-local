FactoryGirl.define do  factory :simple_editable_inline_text_storage, :class => 'SimpleEditable::InlineTextStorage' do
    
  end

  factory :simple_editable_inline_text, :class => 'SimpleEditable::InlineText' do
    sequence(:key) { |n| "key#{n}" }
    text 'Test text'
  end
end
