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

  def new
    @book = Book.new
  end

  def create
    book_params[:title] = book_params[:title].titleize
    book = Book.new(book_params)
    if book.save
      authors = author_params[:author].titleize.split(", ")
      authors.each do |author|
        new_author = Author.find_or_create_by(name: author)
        new_author.books << book
      end
      redirect_to book_path(book)
    else
      @book = Book.new
      render :new
    end
  end

  private

  def book_params
    params.require(:book).permit(:title, :pages, :year_pub, :image)
  end

  def author_params
    params.require(:book).permit(:author)
  end
end
