class BooksController < ApplicationController
  def index
    @books = Book.all
    desc = "desc"
    asc = "asc"
    @highest_rated_books = Book.rated_books(desc)
    @worst_rated_books = Book.rated_books(asc)
    @most_ratings = Review.total_count
  end
end
