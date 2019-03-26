require 'rails_helper'

describe "on the user show page" do
  before :each do
    @book_1 = create(:book)
    @book_2 = create(:book)
    @book_3 = create(:book)
    @review_1 = create(:review, book_id: @book_1.id, created_at: 3.days.ago)
    @review_2 = create(:review, rating: 4, book_id: @book_2.id, created_at: 4.days.ago)
    @review_3 = create(:review, rating: 5, user_name: "Joe", book_id: @book_1.id, created_at: 1.day.ago)
    @review_4 = create(:review, book_id: @book_3.id, created_at: 2.days.ago)
    @review_5 = create(:review, book_id: @book_3.id, user_name: "Jackie", created_at: 2.days.ago)

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
    visit user_path("#{@review_2.user_name}")

    click_link "Delete Review: #{@review_2.title}"

    expect(page).to_not have_content("Review Title: #{@review_2.title}")
    expect(page).to have_content("Review Title: #{@review_4.title}")
  end

  it "delete a review from a user with a single review" do
    visit "/user/#{@review_5.user_name}"

    click_link "Delete Review: #{@review_5.title}"

    expect(current_path).to eq(books_path)
  end
end

#   As a Visitor,
# When I visit a user's show page
# I should also see links to sort reviews in the following ways:
# - sort reviews newest first (descending chronological order)
# - sort reviews oldest first (ascending chronological order)
describe "on the user show page" do
    before :each do
      @book_1 = create(:book)
      @book_2 = create(:book)
      @book_3 = create(:book)
      @review_1 = create(:review, book_id: @book_1.id, created_at: 3.days.ago)
      @review_2 = create(:review, book_id: @book_2.id, created_at: 4.days.ago)
      @review_3 = create(:review, book_id: @book_1.id, created_at: 1.day.ago)
      @review_4 = create(:review, book_id: @book_3.id, created_at: 2.days.ago)
    end

  it "sorts reviews in desc order" do
    visit "/user/#{@review_1.user_name}"

    click_link "Sort Reviews in Descending Order"
# save_and_open_page
    expect(page.all("ul")[0]).to have_content("Review Title: #{@review_3.title}")
    expect(page.all("ul")[1]).to have_content("Review Title: #{@review_4.title}")
    expect(page.all("ul")[2]).to have_content("Review Title: #{@review_1.title}")
  end

  it "sorts reviews in asc order" do
    visit "/user/#{@review_1.user_name}"

    click_link "Sort Reviews in Ascending Order"
# save_and_open_page
    expect(page.all("ul")[0]).to have_content("Review Title: #{@review_2.title}")
    expect(page.all("ul")[1]).to have_content("Review Title: #{@review_1.title}")
    expect(page.all("ul")[2]).to have_content("Review Title: #{@review_4.title}")
  end

end
