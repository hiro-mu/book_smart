class CreateHighlights < ActiveRecord::Migration[6.0]
  def change
    create_table :highlights do |t|
      t.string     :text, null: false
      t.integer    :pagenum, null: false
      t.references :book, foreign_key: true
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
