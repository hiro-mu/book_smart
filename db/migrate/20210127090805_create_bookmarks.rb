class CreateBookmarks < ActiveRecord::Migration[6.0]
  def change
    create_table :bookmarks do |t|
      t.string      :page,  null:false
      t.references  :book,  foreign_key: true
      t.timestamps
    end
  end
end
