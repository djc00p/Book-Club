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

#   As a Visitor,
# When I visit an author's show page,
# For each book written by that author
# I should see one of the highest rated reviews
# (review should contain the title, score, and user name)
  describe "for each book" do
    it "shows one of the highest reviews" do
      author = Author.create(name: "Joseph")
      book_1 = author.books.create(title: "book1", pages: 5, year_pub: 1980)
      book_2 = author.books.create(title: "book2", pages: 6, year_pub: 1990)
      review_1 = book_1.reviews.create(title: "It's ok", rating: 3, review_text: "not bad", user_name: "Joel")
      review_2 = book_1.reviews.create(title: "It's bad", rating: 1, review_text: "really bad", user_name: "Jimmy")
      review_3 = book_2.reviews.create(title: "It's great", rating: 5, review_text: "really great", user_name: "Josh")
      review_4 = book_2.reviews.create(title: "It's decent", rating: 4, review_text: "liked it", user_name: "Jesse")

      visit author_path(author)

      within "#author_show_book#{book_1.id}" do
        expect(page).to have_content(review_1.title)
        expect(page).to have_content(review_1.rating)
        expect(page).to have_content(review_1.user_name)
        expect(page).to_not have_content(review_3.title)
      end
      within "#author_show_book#{book_2.id}" do
        expect(page).to have_content(review_3.title)
        expect(page).to have_content(review_3.rating)
        expect(page).to have_content(review_3.user_name)
        expect(page).to_not have_content(review_1.title)
      end

    end
  end
end
