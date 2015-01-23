class CreateSimpleEditableInlineTexts < ActiveRecord::Migration
  def change
    create_table :simple_editable_inline_texts do |t|

      t.timestamps null: false
    end
  end
end
