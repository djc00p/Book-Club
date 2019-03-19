require 'rails_helper'

RSpec.describe Author, type: :model do
  describe "Validations" do
    it { should validate_presence_of :name}
  end
  describe "Relationships" do
    it {should have_many :author_books}
    it {should have_many(:books).through :author_books}
  end
end
