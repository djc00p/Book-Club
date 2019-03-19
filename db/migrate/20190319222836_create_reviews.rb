class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.string :title
      t.integer :rating
      t.text :review_text
      t.string :user_name

      t.timestamps
    end
  end
end
