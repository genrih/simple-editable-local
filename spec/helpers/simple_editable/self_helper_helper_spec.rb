require 'rails_helper'

module SimpleEditable
  RSpec.describe SelfHelper, :type => :helper do
    describe "simple_editable_admin_user" do
      it 'should return true (no auth method)' do
        SimpleEditable.admin_user = false
        expect(SelfHelper.simple_editable_admin_user).to eq(true)
      end

      it 'should return allowed' do
        #make a fake auth method
        allow(SelfHelper).to receive(:auth_method).and_return(:allowed)
        SimpleEditable.admin_user = :auth_method
        expect(SelfHelper.simple_editable_admin_user).to eq(:allowed)
      end
    end
  end
end
