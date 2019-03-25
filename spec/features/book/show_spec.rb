require 'rails_helper'

RSpec.describe "book show page" do
  describe "Shows book information" do
    before :each do
      @author_1 = Author.create(name: "James")
      @author_2 = Author.create(name: "Mary")
      @book_1 = create(:book, image: "https://upload.wikimedia.org/wikipedia/en/f/f0/Harry_Potter_and_the_Half-Blood_Prince.jpg")
      create(:author_book, author: @author_1, book: @book_1)
      @author_2.books << @book_1
      @review_1 = create(:review, book_id: @book_1.id)
      @review_2 = create(:review, rating: 4, user_name: "John", book_id: @book_1.id)
      @review_3 = create(:review, rating: 5, user_name: "Joe", book_id: @book_1.id)
      @review_4 = create(:review, rating: 1, user_name: "Jack", book_id: @book_1.id)
      @review_5 = create(:review, rating: 2, user_name: "Jill", book_id: @book_1.id)
      @review_6 = create(:review, rating: 3, user_name: "Jane", book_id: @book_1.id)
      @review_7 = create(:review, rating: 4, user_name: "Jenny", book_id: @book_1.id)
    end

    it "shows book title" do
      visit book_path(@book_1)

      expect(page).to have_content(@book_1.title)
    end

    it "shows author(s)" do
      visit book_path(@book_1)

      expect(page).to have_content("Author(s): #{@book_1.authors.pluck(:name).join(", ")}")
    end

    it "shows number of pages" do
      visit book_path(@book_1)

      expect(page).to have_content("Pages: 305")
    end

    it "shows year published" do
      visit book_path(@book_1)

      expect(page).to have_content("Year Published: 2006")
    end

    it "shows an image" do
      visit book_path(@book_1)
      # save_and_open_page
      within ".book_image" do
        expect(page).to have_css("img[src*='#{@book_1.image}']")
      end
    end

    it "shows the reviews for the book" do
      visit book_path(@book_1)

      expect(page).to have_content("Reviews")

      expect(page.all("#review")[0]).to have_content(@review_1.title)
      expect(page.all("#review")[1]).to have_content(@review_2.title)
      expect(page.all("#review")[2]).to have_content(@review_3.title)
      expect(page.all("#review")[3]).to have_content(@review_4.title)
      expect(page.all("#review")[4]).to have_content(@review_5.title)
      expect(page.all("#review")[5]).to have_content(@review_6.title)
      expect(page.all("#review")[6]).to have_content(@review_7.title)

      expect(page.all("#review")[0]).to have_content(@review_1.user_name)
      expect(page.all("#review")[1]).to have_content(@review_2.user_name)
      expect(page.all("#review")[2]).to have_content(@review_3.user_name)
      expect(page.all("#review")[3]).to have_content(@review_4.user_name)
      expect(page.all("#review")[4]).to have_content(@review_5.user_name)
      expect(page.all("#review")[5]).to have_content(@review_6.user_name)
      expect(page.all("#review")[6]).to have_content(@review_7.user_name)

      expect(page.all("#review")[0]).to have_content(@review_1.rating)
      expect(page.all("#review")[1]).to have_content(@review_2.rating)
      expect(page.all("#review")[2]).to have_content(@review_3.rating)
      expect(page.all("#review")[3]).to have_content(@review_4.rating)
      expect(page.all("#review")[4]).to have_content(@review_5.rating)
      expect(page.all("#review")[5]).to have_content(@review_6.rating)
      expect(page.all("#review")[6]).to have_content(@review_7.rating)

      expect(page.all("#review")[0]).to have_content(@review_1.review_text)
      expect(page.all("#review")[1]).to have_content(@review_2.review_text)
      expect(page.all("#review")[2]).to have_content(@review_3.review_text)
      expect(page.all("#review")[3]).to have_content(@review_4.review_text)
      expect(page.all("#review")[4]).to have_content(@review_5.review_text)
      expect(page.all("#review")[5]).to have_content(@review_6.review_text)
      expect(page.all("#review")[6]).to have_content(@review_7.review_text)
    end
  end

  describe "on the book show page" do
    context "shows book statistics" do
      before :each do
        @book_1 = create(:book)
        @review_1 = create(:review, book_id: @book_1.id)
        @review_2 = create(:review, rating: 4, user_name: "John", book_id: @book_1.id)
        @review_3 = create(:review, rating: 5, user_name: "Joe", book_id: @book_1.id)
        @review_4 = create(:review, rating: 1, user_name: "Jack", book_id: @book_1.id)
        @review_5 = create(:review, rating: 2, user_name: "Jill", book_id: @book_1.id)
        @review_6 = create(:review, rating: 3, user_name: "Jane", book_id: @book_1.id)
        @review_7 = create(:review, rating: 4, user_name: "Jenny", book_id: @book_1.id)
      end

      it "has top 3 reviews" do

        visit book_path(@book_1)

        within ".show_top_reviews" do
          expect(page).to have_content("#{@review_3.title}")
          expect(page).to have_content("#{@review_7.title}")
          expect(page).to have_content("#{@review_2.title}")
          expect(page).to have_content("Rating: #{@review_7.rating}")
          expect(page).to have_content("Rating: #{@review_3.rating}")
          expect(page).to have_content("Rating: #{@review_2.rating}")
          expect(page).to have_content("Reviewer: #{@review_7.user_name}")
          expect(page).to have_content("Reviewer: #{@review_3.user_name}")
          expect(page).to have_content("Reviewer: #{@review_2.user_name}")
        end
      end

      it "has bottom 3 reviews" do

        visit book_path(@book_1)

        within ".show_bottom_reviews" do
          expect(page).to have_content("#{@review_4.title}")
          expect(page).to have_content("#{@review_5.title}")
          expect(page).to have_content("#{@review_1.title}")
          expect(page).to have_content("Rating: #{@review_4.rating}")
          expect(page).to have_content("Rating: #{@review_5.rating}")
          expect(page).to have_content("Rating: #{@review_1.rating}")
          expect(page).to have_content("Reviewer: #{@review_4.user_name}")
          expect(page).to have_content("Reviewer: #{@review_5.user_name}")
          expect(page).to have_content("Reviewer: #{@review_1.user_name}")
        end
      end

      it "shows average rating for this book" do

        visit book_path(@book_1)

        within ".show_avg_rating" do
          expect(page).to have_content("Average Rating: 3.1")
        end
      end

      it "should let a user create a new review" do

        visit book_path(@book_1)

        expect(page).to have_link("Add a new Review")

        click_link "Add a new Review"

        expect(current_path).to eq(new_book_review_path(@book_1.id))

        fill_in "Title", with: "Great"
        fill_in "Rating", with: 4
        fill_in "User name", with: "three stooges"
        fill_in "Review text", with: "This is a good book"
        click_on "Create Review"

        expect(current_path).to eq(book_path(@book_1))

        within ".book_show_info" do
          expect(page).to have_content("Review title: Great")
          expect(page).to have_content("Reviewer: Three Stooges")
          expect(page).to have_content("Review rating: 4")
          expect(page).to have_content("Review: This is a good book")
        end
      end

      it "should not let a user enter partial review data" do

        visit book_path(@book_1)

        expect(page).to have_link("Add a new Review")

        click_link "Add a new Review"

        expect(current_path).to eq(new_book_review_path(@book_1.id))

        #not entering a title here, so app should force an error message
        fill_in "Rating", with: 4
        fill_in "User name", with: "three stooges"
        fill_in "Review text", with: "This is a good book"
        click_on "Create Review"

        expect(current_path).to eq(book_reviews_path(@book_1.id))
        expect(page).to have_content("Incorrect data entered. Please try again.")

        # within ".book_show_info" do
        #   expect(page).to have_content("Review title: Great")
        #   expect(page).to have_content("Reviewer: Three Stooges")
        #   expect(page).to have_content("Review rating: 4")
        #   expect(page).to have_content("Review: This is a good book")
        # end
      end
    end
  end
end
