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

  def destroy
    username = Review.find(params[:id]).user_name
    review = Review.find(params[:id])
    review.destroy
    flash.notice = "Review has been deleted."
    # binding. pry
    if Review.where(user_name: username) == []
      redirect_to books_path
    else
      redirect_to "/user/#{username}"
    end
    # redirect_to
  end

  private

  def review_params
    params.require(:review).permit(:title, :rating, :user_name, :review_text)
  end

  def book_params
    params.require(:book_id)
  end
end
