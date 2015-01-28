class CreateSimpleEditableInlineTexts < ActiveRecord::Migration
  def up
    create_table :simple_editable_inline_texts, id: false do |t|
      t.string :key
      t.text :text
    end
    add_index :simple_editable_inline_texts, :key, unique: true
  end

  def down
    drop_table :simple_editable_inline_texts
  end
end
