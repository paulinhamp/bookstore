class CreateBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :books do |t|
      t.string  :title
      t.integer :pages
      t.text    :synopsis
      
      t.references :publisher, foreign_key: true
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
