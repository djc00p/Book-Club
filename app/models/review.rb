class Review < ApplicationRecord
  validates_presence_of :title
  validates_presence_of :rating
  validates_presence_of :review_text
  validates_presence_of :user_name
  validates_numericality_of :rating, greater_than_or_equal_to: 0
  validates_numericality_of :rating, less_than_or_equal_to: 5
  belongs_to :book

  def self.total_count
    Review.group(:user_name).count(:review_text)
  end
end
