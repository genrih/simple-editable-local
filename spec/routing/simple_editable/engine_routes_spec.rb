require 'rails_helper'

RSpec.describe SimpleEditable, 'routing to profiles', type: :routing do
  routes { SimpleEditable::Engine.routes }

  it 'route to update inline text' do
    routes { SimpleEditable::Engine.routes }
    Rails.application.reload_routes!
    expect(update_inline_text_path).to eq '/simple_editable/update_inline_text'
  end

  it 'route to update inline object' do
    routes { SimpleEditable::Engine.routes }
    Rails.application.reload_routes!
    expect(update_inline_object_path).to eq '/simple_editable/update_inline_object'
  end
end
