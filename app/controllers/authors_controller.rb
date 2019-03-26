class AuthorsController < ApplicationController

  def show
    # binding.pry
    @books = Book.joins(:authors).where(authors: {id: params[:id]})
    # binding.pry
  end

end
