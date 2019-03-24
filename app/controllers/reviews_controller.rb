class ReviewsController < ApplicationController
  def new
    @book = Book.find(params[:book_id])
    @review = Review.new
  end

  def create
    edited_review_params = review_params
    edited_review_params[:user_name] = review_params[:user_name].titleize
    @book = Book.find(params[:book_id])
    @review = @book.reviews.new(edited_review_params)
    if @review.save
      redirect_to book_path(@book)
    else
      flash.notice = "Incorrect data entered.  Please try again."
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:title, :rating, :user_name, :review_text)
  end

  # def book_params
  #   params.require(:book_id)
  # end
end
