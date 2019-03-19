class CreateAuthorBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :author_books do |t|
      t.references :book, foreign_key: true
      t.references :author, foreign_key: true
      
      t.timestamps
    end
  end
end
