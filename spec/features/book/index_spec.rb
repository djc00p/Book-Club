require 'rails_helper'

RSpec.describe "book index page", type: :feature do
  describe "As a Visitor" do
    before :each do
      # @author_1 = Author.create(name: "Joe")
      @author_1 = create(:author)
      @book_1 = @author_1.books.create(title: "In the wind", pages: 329, year_pub: 1995, image: "https://upload.wikimedia.org/wikipedia/en/f/f0/Harry_Potter_and_the_Half-Blood_Prince.jpg")
      @book_2 = @author_1.books.create(title: "in flames", pages: 567, year_pub: 2015, image: "hfjqlsfhipueqhnf")
      @book_3 = create(:book, created_at: 3.days.ago)
      # @author_1.books << @book_3
      create(:author_book, author: @author_1, book: @book_3)
      # binding.pry
      @review_1 = create(:review, book_id: @book_1.id)
      @review_2 = create(:review, rating: 5, book_id: @book_1.id, user_name: "Jenna")
      @review_3 = create(:review, rating: 4, book_id: @book_1.id)
      @review_4 = create(:review, rating: 2, book_id: @book_1.id, user_name: "Jenna")
      @review_5 = create(:review, rating: 5, book_id: @book_2.id)
      @review_6 = create(:review, rating: 5, book_id: @book_2.id, user_name: "Jenna")
      @review_7 = create(:review, rating: 1, book_id: @book_3.id)
      @review_8 = create(:review, rating: 3, book_id: @book_3.id, user_name: "Bob")
      @review_9 = create(:review, rating: 4, book_id: @book_3.id, user_name: "Bob")
    end
    it "shows all book titles" do
      # binding.pry

      visit books_path

      within "#info-#{@book_1.id}" do
        expect(page).to have_content(@book_1.authors.pluck(:name).join(", "))
        expect(page).to have_content(@book_1.title)
        expect(page).to have_content("Pages: #{@book_1.pages}")
        expect(page).to have_content("Year Published: #{@book_1.year_pub}")
        expect(page).to have_css("img[src*='#{@book_1.image}']")
        expect(page).to_not have_content(@book_2.title)
      end
      within "#info-#{@book_2.id}" do
        expect(page).to have_content(@book_2.authors.pluck(:name).join(", "))
        expect(page).to have_content(@book_2.title)
        expect(page).to have_content("Pages: #{@book_2.pages}")
        expect(page).to have_content("Year Published: #{@book_2.year_pub}")
        expect(page).to have_css("img[src*='#{@book_2.image}']")
        expect(page).to_not have_content(@book_1.title)
      end
    end

    it "shows average book rating" do
      visit books_path

      within "#info-#{@book_1.id}" do
        expect(page).to have_content(@book_1.title)
        expect(page).to have_content("Average Book Rating: 3.5")
        expect(page).to have_content("Total Reviews: 4")
      end
    end

    it "shows book statistics" do
      visit books_path

      within "#highest_rated_books" do
        expect(page).to have_content("Highest Rated Books")
        expect(page).to have_content("in flames, 5.0")
        expect(page).to have_content("In the wind, 3.5")
        expect(page).to have_content("#{@book_3.title}, 2.7")
      end
      within "#worst_rated_books" do
        expect(page).to have_content("Worst Rated Books")
        expect(page).to have_content("#{@book_3.title}, 2.7")
        expect(page).to have_content("In the wind, 3.5")
        expect(page).to have_content("in flames, 5.0")
      end
      within "#users_with_most_reviews" do
        # binding.pry
        expect(page).to have_content("User With Most Reviews")
        expect(page).to have_content("James, 4")
        expect(page).to have_content("Jenna, 3")
        expect(page).to have_content("Bob, 2")
      end
    end
    it "can sort the books" do
      visit books_path

      expect(page).to have_link("Sort by Highest Rated Book")

      click_link "Sort by Highest Rated Book"

      expect(page.all("ul")[1]).to have_content(@book_2.title)
      expect(page.all("ul")[2]).to have_content(@book_1.title)
      expect(page.all("ul")[3]).to have_content(@book_3.title)

      expect(page).to have_link("Sort by Lowest Rated Book")

      click_link "Sort by Lowest Rated Book"


      expect(page.all("ul")[1]).to have_content(@book_3.title)
      expect(page.all("ul")[2]).to have_content(@book_1.title)
      expect(page.all("ul")[3]).to have_content(@book_2.title)

      expect(page).to have_link("Sort by Most Amount of Pages")

      click_link "Sort by Most Amount of Pages"


      expect(page.all("ul")[1]).to have_content(@book_2.title)
      expect(page.all("ul")[2]).to have_content(@book_1.title)
      expect(page.all("ul")[3]).to have_content(@book_3.title)

      expect(page).to have_link("Sort by Least Amount of Pages")

      click_link "Sort by Least Amount of Pages"


      expect(page.all("ul")[1]).to have_content(@book_3.title)
      expect(page.all("ul")[2]).to have_content(@book_1.title)
      expect(page.all("ul")[3]).to have_content(@book_2.title)

      expect(page).to have_link("Sort by Most Amount of Reviews")

      click_link "Sort by Most Amount of Reviews"


      expect(page.all("ul")[1]).to have_content(@book_1.title)
      expect(page.all("ul")[2]).to have_content(@book_3.title)
      expect(page.all("ul")[3]).to have_content(@book_2.title)

      expect(page).to have_link("Sort by Least Amount of Reviews")

      click_link "Sort by Least Amount of Reviews"


      expect(page.all("ul")[1]).to have_content(@book_2.title)
      expect(page.all("ul")[2]).to have_content(@book_3.title)
      expect(page.all("ul")[3]).to have_content(@book_1.title)
    end
#     As a visitor
# With the exception of a book's show page,
# Anywhere I see a book title on the site,
# I can click on the book title to go to that book's show page.
    it "has book titles as links to show page" do
      visit books_path

      within "#info-#{@book_1.id}" do
        click_link "#{@book_1.title}"
      end

      expect(current_path).to eq(book_path(@book_1.id))

      visit books_path

      within "#highest_rated_books"do
        click_link "#{@book_2.title}"
      end

      expect(current_path).to eq(book_path(@book_2.id))

      visit books_path

      within "#worst_rated_books" do
        click_link "#{@book_3.title}"
      end

      expect(current_path).to eq(book_path(@book_3.id))

      visit "/user/#{@review_6.user_name}"

      within "#book_title_path#{@review_6.id}"do
      # save_and_open_page
        click_link "#{@book_2.title}"
      end

      expect(current_path).to eq(book_path(@book_2.id))
    end
  end
end
