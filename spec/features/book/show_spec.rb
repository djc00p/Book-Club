require 'rails_helper'

describe "on the book show page" do
  context "shows book statistics" do
    before :each do
      @book_1 = create(:book)
      @book_2 = create(:book)
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
# save_and_open_page
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
  end
end
