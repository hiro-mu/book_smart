class CreatePages < ActiveRecord::Migration[6.0]
  def change
    create_table :pages do |t|
      t.string      :pagenum
      t.references :book     ,foreign_key: true
      t.timestamps
    end
  end
end
