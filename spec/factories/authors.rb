FactoryBot.define do
  factory :Author do
    sequence(:name) {|n| "Name #{n}"}
  end
end
