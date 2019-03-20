FactoryBot.define do
  factory :author do
    sequence(:name) {|n| "Name #{n}"}
  end
end
