class BooksController < ApplicationController
  def index
    @books = Book.all
    desc = "desc"
    asc = "asc"
    @highest_rated_books = Book.rated_books(desc)
    @worst_rated_books = Book.rated_books(asc)
    @most_ratings = Review.total_count

    case params[:sort]
    when "high_rating"
      @books = @highest_rated_books
      render :index
    when "low_rating"
      @books = @worst_rated_books
      render :index
    when "most_pages"
      @books = Book.amount_of_pages(desc)
      render :index
    when "least_pages"
      @books = Book.amount_of_pages(asc)
      render :index
    when "most_reviews"
      @books = Book.amount_of_reviews(desc)
      render :index
    when "least_reviews"
      @books = Book.amount_of_reviews(asc)
      render :index
    else
      @books = Book.all
    end
  end

  def show
    @book = Book.find(params[:id])
  end
end
