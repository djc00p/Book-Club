require 'rails_helper'

RSpec.describe Review, type: :model do
  describe "Validations" do
    it { should validate_presence_of :title}
    it { should validate_presence_of :rating}
    it { should validate_presence_of :review_text}
    it { should validate_presence_of :user_name}
    it { should validate_numericality_of(:rating).is_greater_than_or_equal_to(0)}
    it { should validate_numericality_of(:rating).is_less_than_or_equal_to(5)}
  end
  describe "Relationships" do
    it {should belong_to :book}
  end

  describe "Class Method" do
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
    it ".total_count" do
      expected = {"Bob"=>2, "James"=>4, "Jenna"=>3}
      expect(Review.total_count).to eq(expected)
    end
  end
end
