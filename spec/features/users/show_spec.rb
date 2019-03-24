require 'rails_helper'

describe "on the user show page" do
  before :each do
    @book_1 = create(:book)
    @book_2 = create(:book)
    @book_3 = create(:book)
    @book_4 = create(:book)
    @review_1 = create(:review, book_id: @book_1.id)
    @review_2 = create(:review, rating: 4, book_id: @book_2.id)
    @review_3 = create(:review, rating: 5, user_name: "Joe", book_id: @book_1.id)
    @review_4 = create(:review, rating: 2, user_name: "Joe", book_id: @book_2.id)
    @review_5 = create(:review, rating: 1, user_name: "Jeff", book_id: @book_4.id)
    @review_6 = create(:review, rating: 5, user_name: "Joycerak", book_id: @book_3.id)
  end

  it "shows all reviews for that user" do

    visit book_path(@book_1)

    within ".book_show_info" do
      click_link "#{@review_1.user_name}"
    end

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

  it "delete a review from a user with multiple reviews" do
    visit "/user/#{@review_3.user_name}"

    click_link "Delete Review: #{@review_3.title}"

    expect(page).to_not have_content("Review Title: #{@review_3.title}")
    expect(page).to have_content("Review Title: #{@review_4.title}")
  end

  it "delete a review from a user with a single review" do
    visit "/user/#{@review_5.user_name}"

    click_link "Delete Review: #{@review_5.title}"

    expect(current_path).to eq(books_path)
  end
end
