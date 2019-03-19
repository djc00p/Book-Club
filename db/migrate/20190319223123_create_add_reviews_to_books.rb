class CreateAddReviewsToBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :add_reviews_to_books do |t|
      t.references :book, foreign_key: true
    end
  end
end
