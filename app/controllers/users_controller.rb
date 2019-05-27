class UsersController < ApplicationController

  def show
    @user_name = params[:id]
    case params[:sort]
    when "descend"
      @user_review = Review.where(user_name: params[:id]).order(created_at: :desc)
    when "ascend"
      @user_review = Review.where(user_name: params[:id]).order(:created_at)
    else
      @user_review = Review.where(user_name: params[:id])
    end
  end

end
