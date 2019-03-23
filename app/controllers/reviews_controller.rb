class ReviewsController < ApplicationController
  def new
    @book = Book.find(params[:book_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.save
    @book = Book.find(params[:book_id])
    @book.reviews << @review
    redirect_to book_path(@book)
  end

  private

  def review_params
    params.require(:review).permit(:title, :rating, :user_name, :review_text)
  end

  def book_params
    params.require(:book_id)
  end
end
