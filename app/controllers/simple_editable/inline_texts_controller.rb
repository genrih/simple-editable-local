module SimpleEditable
  class InlineTextsController < ApplicationController
    def update
      value = params[:text_only] == 'true' ? ActionController::Base.helpers.sanitize(params[:value], tags: ['br']) : params[:value]
      SimpleEditable::InlineTextStorage.new.update(params[:pk], value)
      head :ok
    end
  end
end
