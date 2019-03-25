require 'rails_helper'

RSpec.describe Book, type: :model do
  describe "Validations" do
    it { should validate_uniqueness_of :title}
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
      @author_2 = Author.create(name: "Mary")
      @book_1 = @author_1.books.create(title: "In the wind", pages: 329, year_pub: 1995, image: "https://upload.wikimedia.org/wikipedia/en/f/f0/Harry_Potter_and_the_Half-Blood_Prince.jpg")
      @book_2 = @author_1.books.create(title: "in flames", pages: 567, year_pub: 2015, image: "hfjqlsfhipueqhnf")
      @book_3 = create(:book, created_at: 3.days.ago)
      @author_2.books << @book_1
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

    it "should return 3 highest reviews" do
      direction = :desc
      expect(@book_1.reviews_by_rating(@book_1, "#{direction}")).to eq([@review_2, @review_3, @review_1])
    end

    it "should return 3 lowest reviews" do
      direction = :asc
      expect(@book_1.reviews_by_rating(@book_1, "#{direction}")).to eq([@review_4, @review_1, @review_3])
    end
    it "should list all authors" do
      expect(@book_1.lists_authors(@book_1)).to eq("#{@author_1.name}, Mary")
    end
  end

  describe "Class Methods" do
    before :each do
      # @author_1 = Author.create(name: "Joe")
      @author_1 = create(:author)
      @author_2 = Author.create(name: "Mary")
      @book_1 = @author_1.books.create(title: "In the wind", pages: 329, year_pub: 1995, image: "https://upload.wikimedia.org/wikipedia/en/f/f0/Harry_Potter_and_the_Half-Blood_Prince.jpg")
      @author_2.books << @book_1
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
      # @review_10 = create(:review, rating: 4, book_id: @book_3.id, user_name: "Ace")

    end
    it ".rated_books" do
      asc ="asc"
      desc ="desc"
      rating = Book.rated_books(desc)
      rating_2 = Book.rated_books(asc)
      expect(rating.first.title).to eq("in flames")
      expect(rating_2.first.title).to eq("#{@book_3.title}")
      expect(rating.second.title).to eq("In the wind")
      expect(rating_2.second.title).to eq("In the wind")
    end

    it ".amount_of_reviews" do
      asc ="asc"
      desc ="desc"
      expect(Book.amount_of_reviews(desc)).to eq([@book_1,@book_3,@book_2])
      expect(Book.amount_of_reviews(asc)).to eq([@book_2,@book_3,@book_1])
    end

    it ".amount_of_pages" do
      asc ="asc"
      desc ="desc"

      expect(Book.amount_of_pages(desc)).to eq([@book_2,@book_1,@book_3])
      expect(Book.amount_of_pages(asc)).to eq([@book_3,@book_1,@book_2])
    end

  end
end
