require 'rails_helper'

RSpec.describe Book, type: :model do
  describe "Validations" do
    it { should validate_presence_of :title}
    it { should validate_presence_of :pages}
    it { should validate_presence_of :year_pub}
    it { should validate_numericality_of(:pages).is_greater_than(1)}
    it { should validate_numericality_of(:year_pub).only_integer}
  end
  describe "Relationships" do
    it {should have_many :author_books}
    it {should have_many(:authors).through :author_books}
    it {should have_many :reviews}
  end
end
