module SimpleEditable
  class InlineObjectsController < ApplicationController
    def update
      klass = params[:class_name].constantize
      object = klass.find(params[:id])
      object.send(:write_attribute, params[:attribute], params[:value])
      object.save(validate: false)
      head :ok
    end
  end
end
