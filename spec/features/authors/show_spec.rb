require 'rails_helper'
# As a Visitor,
# When I visit an author's show page
# I see all books by that author
# Each book should show:
# - the book title
# - the number of pages in the book
# - the year the book was published
# - a small image of the book cover
#
# Each book should show a list of any other authors
# (exclude this show page's author from that list)
describe "on the author's show page" do
  describe "shows all books by the author" do
    it "shows each book's info" do
      author = Author.create(name: "Joseph")
      author2 = Author.create(name: "Jerry")
      book_1 = author.books.create(title: "book1", pages: 5, year_pub: 1980)
      book_2 = author.books.create(title: "book2", pages: 6, year_pub: 1990)
      book_3 = author.books.create(title: "book3", pages: 7, year_pub: 1995)
      author2.books << book_3

      visit author_path(author)

      within "#author_show_book#{book_1.id}" do
        expect(page).to have_content(book_1.title)
        expect(page).to have_content(book_1.pages)
        expect(page).to have_content(book_1.year_pub)
      end
      within "#author_show_book#{book_2.id}" do
        expect(page).to have_content(book_2.title)
        expect(page).to have_content(book_2.pages)
        expect(page).to have_content(book_2.year_pub)
      end
      within "#author_show_book#{book_3.id}" do
        # save_and_open_page
        expect(page).to have_content(book_3.title)
        expect(page).to have_content(book_3.pages)
        expect(page).to have_content(book_3.year_pub)
        expect(page).to have_content("Additional Author(s): #{author2.name}")
      end
    end
  end
end
