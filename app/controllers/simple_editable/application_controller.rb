module SimpleEditable
  class ApplicationController < ActionController::Base
    before_filter :simple_editable_authentication_method

    private

    def simple_editable_authentication_method
      SimpleEditable.authentication_method ? send(SimpleEditable.authentication_method) : true
    end
  end
end
