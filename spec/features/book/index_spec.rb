require 'rails_helper'

RSpec.describe "book index page", type: :features do
  describe "As a Visitor" do
    before :each do
      @author_1 = Author.create(name: "Joe")
      @book_1 = @author_1.books.create(title: "In the wind", pages: 329, year_pub: 1995, image: "https://upload.wikimedia.org/wikipedia/en/f/f0/Harry_Potter_and_the_Half-Blood_Prince.jpg")
      @book_2 = @author_1.books.create(title: "in flames", pages: 567, year_pub: 2015, image: "hfjqlsfhipueqhnf")
    end
    it "shows all book titles" do
      # binding.pry

      visit '/books'

      within ".info-#{@book_1.id}" do
        expect(page).to have_content(@book_1.authors.pluck(:name).join(", "))
        expect(page).to have_content(@book_1.title)
        expect(page).to have_content(@book_1.pages)
        expect(page).to have_content(@book_1.year_pub)
        expect(page).to have_css("img[src*='#{@book_1.image}']")
        expect(page).to_not have_content(@book_2.title)
      end
    end
  end
end
