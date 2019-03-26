class AuthorsController < ApplicationController

  def show
    @books = Book.joins(:authors).where(authors: {id: params[:id]})
    @author = Author.find(params[:id])
  end

  def destroy
    author = Author.find(params[:id])
    books = author.books
    books.each do |book|
      book.reviews.each do |review|
        review.destroy
      end
      book.destroy
    end
    author.destroy
    redirect_to books_path
  end
end
