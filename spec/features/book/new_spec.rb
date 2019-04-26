require 'rails_helper'

RSpec.describe "New book page" do
  describe "when i visit book index page" do
    before :each do
      @author_1 = create(:author)
      @book_1 = @author_1.books.create(title: "In The Wind", pages: 329, year_pub: 1995, image: "https://upload.wikimedia.org/wikipedia/en/f/f0/Harry_Potter_and_the_Half-Blood_Prince.jpg")
      @book_2 = @author_1.books.create(title: "In Flames", pages: 567, year_pub: 2015, image: "hfjqlsfhipueqhnf")
      @book_3 = create(:book, created_at: 3.days.ago)
      create(:author_book, author: @author_1, book: @book_3)
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
    it "should have a link to add new book" do
      visit  books_path

      click_link "Add New Book"
        
      fill_in 'Title', with: 'must be nice'
      fill_in 'book[author]', with: "james, jack"
      fill_in 'Pages', with: 345
      fill_in 'Year Published', with: 2009

      click_button 'Create Book'

      saved_book = Book.last

      visit book_path(saved_book)

      image = "https://smartmobilestudio.com/wp-content/uploads/2012/06/leather-book-preview.png"

      expect(page).to have_content('Must Be Nice')
      expect(page).to have_content('James Jack')
      expect(page).to have_content('345')
      expect(page).to have_content('2009')
      expect(page).to have_css("img[contains(src,'https://smartmobilestudio.com/wp-content/uploads/2012/06/leather-book-preview.png')]")
    end

    it "should not add exisiting book" do
      visit  books_path
      #   
      click_link "Add New Book"

      fill_in 'Title', with: 'In The Wind'
      fill_in 'book[author]', with: "james, jack"
      fill_in 'Pages', with: 345
      fill_in 'Year Published', with: 2009

      click_button 'Create Book'

      expect(current_path).to eq(books_path)
    end
  end
end
