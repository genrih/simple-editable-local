require 'rails_helper'

module SimpleEditable
  RSpec.describe InlineObjectsController, type: :controller do
    before :all do
      m = ActiveRecord::Migration.new
      m.verbose = false
      m.create_table :simple_editable_test_table do |t|
        t.string :name
      end
    end

    after :all do
      m = ActiveRecord::Migration.new
      m.verbose = false
      m.drop_table :simple_editable_test_table
    end

    describe 'POST #update' do
      routes { SimpleEditable::Engine.routes }
      it 'should update a record' do
        test = Testing.create(name: 'Name')
        put :update, {class_name: test.class, id: test.id, attribute: :name, value: 'New name' }
        test.reload

        expect(test.name).to eq('New name')
      end
    end
  end
end
