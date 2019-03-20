FactoryBot.define do
  factory :review, class: Review do
    sequence(:title) {|n| "Title #{n}"}
    rating { 3 }
    review_text { "something cool"}
    user_name {"James"}
    book
  end
end
