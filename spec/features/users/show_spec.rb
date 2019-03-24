require 'rails_helper'

# When I click on a user's name for any book review
# I am taken to a show page for that user.
# I should see all reviews that this
# user has written.
# Each review shows:
# - the title of the review
# - the description of the review
# - the rating of the review
# - the title of the book
# - the thumbnail image for the book
# - the date the review was written

describe "on the user show page" do
  before :each do
    @book_1 = create(:book)
    @book_2 = create(:book)
    @review_1 = create(:review, book_id: @book_1.id)
    @review_2 = create(:review, rating: 4, book_id: @book_2.id)
    @review_3 = create(:review, rating: 5, user_name: "Joe", book_id: @book_1.id)
  end

  it "shows all reviews for that user" do

    visit book_path(@book_1)
    # save_and_open_page

    click_link "#{@review_1.user_name}"

    expect(current_path).to eq("/user/#{@review_1.user_name}")
    expect(page).to have_content("Review Title: #{@review_1.title}")
    expect(page).to have_content("Review: #{@review_1.review_text}")
    expect(page).to have_content("Review Rating: #{@review_1.rating}")
    expect(page).to have_content("Book Title: #{@book_1.title}")
    expect(page).to have_css("img[src*='#{@book_1.image}']")
    expect(page).to have_content("Date of Review: #{@review_1.created_at}")
    expect(page).to have_content("Review Title: #{@review_2.title}")
    expect(page).to have_content("Review: #{@review_2.review_text}")
    expect(page).to have_content("Review Rating: #{@review_2.rating}")
    expect(page).to have_content("Date of Review: #{@review_2.created_at}")
    expect(page).to_not have_content("Review Title: #{@review_3.title}")
  end
end
