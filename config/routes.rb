SimpleEditable::Engine.routes.draw do
  post '/update_inline_text' => 'inline_texts#update', as: :update_inline_text
  post '/update_inline_object' => 'inline_objects#update', as: :update_inline_object
end
