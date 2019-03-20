FactoryBot.define do
  factory :author, class: Author do
    sequence(:name) {|n| "Name #{n}"}
  end
end
