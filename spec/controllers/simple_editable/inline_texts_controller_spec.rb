require 'rails_helper'

module SimpleEditable
  RSpec.describe InlineTextsController, type: :controller do
    describe 'GET #update' do
      routes { SimpleEditable::Engine.routes }
      it 'should update inline text' do
        inline_text = InlineText.create!(key: 'test', text: 'Hello, this is test')
        put :update, pk: inline_text.key, value: 'New Test'
        expect(response).to be_successful
        inline_text.reload
        expect(inline_text.text).to eq('New Test')
      end
    end
  end
end
