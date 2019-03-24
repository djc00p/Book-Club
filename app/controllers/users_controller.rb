class UsersController < ApplicationController

  def show
    # binding.pry
    @user_review = Review.where(user_name: params[:id])
    @user_name = params[:id]
  end

end
