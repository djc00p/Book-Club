require 'rails_helper'

RSpec.describe Book, type: :model do
  describe "Validations" do
    it { should validate_presence_of :title}
    it { should validate_presence_of :pages}
    it { should validate_presence_of :year_pub}
    it { should validate_numericality_of(:pages).is_greater_than(1)}
    it { should validate_numericality_of(:year_pub).only_integer}
    it { should validate_numericality_of(:pages).only_integer}
  end
  describe "Relationships" do
    it {should have_many :author_books}
    it {should have_many(:authors).through :author_books}
    it {should have_many :reviews}
  end
  describe "Instance Methods" do
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
      @review_2 = create(:review, rating: 5, book_id: @book_1.id)
      @review_3 = create(:review, rating: 4, book_id: @book_1.id)
      @review_4 = create(:review, rating: 2, book_id: @book_1.id)
    end
    it "should calculate average rating" do
      expect(@book_1.avg_rating(@book_1)).to eq(3.5)
    end
  end
  
end
