class Book < ApplicationRecord
  validates_presence_of :title
  validates_presence_of :pages
  validates_presence_of :year_pub
  validates_numericality_of :year_pub, only_integer: true
  validates_numericality_of :pages, greater_than: 1, only_integer: true
  has_many :author_books
  has_many :authors, through: :author_books
  has_many :reviews

  def avg_rating(book)
    book.reviews.average(:rating).to_f.round(1)
  end

  def reviews_by_rating(book, direction)
    book.reviews.order(rating: direction).limit(3)
  end

  def self.rated_books(updown)
    joins(:reviews)
    .select("Books.*, AVG(reviews.rating) as average_rating")
    .group(:id)
    .order("average_rating #{updown}")
  end

  def self.amount_of_reviews(updown)
    joins(:reviews)
    .select("Books.*, reviews.count as review_count")
    .group(:id)
    .order("review_count #{updown}")
  end

  def self.amount_of_pages(updown)
    order("pages #{updown}")
  end
end
