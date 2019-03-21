class BooksController < ApplicationController
  def index
    @books = Book.all
    @highest_rated_books = Book.highest_rated_books
  end
end
