class Book < ApplicationRecord
  validates_presence_of :title
  validates_presence_of :pages
  validates_presence_of :year_pub
  validates_numericality_of :year_pub, only_integer: true
  validates_numericality_of :pages, greater_than: 1
  has_many :author_books
  has_many :authors, through: :author_books
  has_many :reviews
end
