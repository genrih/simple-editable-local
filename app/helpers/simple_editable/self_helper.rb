module SimpleEditable
  module SelfHelper
    def self.simple_editable_admin_user
      SimpleEditable.admin_user ? send(SimpleEditable.admin_user) : true
    end
  end
end
