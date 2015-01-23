class InlineTextsController < ApplicationController
  before_filter :authenticate_admin_user!

  def update
    value = params[:text_only] == 'true' ? ActionController::Base.helpers.sanitize(params[:value], tags: ['br']) : params[:value]
    InlineTextStorage.new.update(params[:pk], value)
    head :ok
  end
end
