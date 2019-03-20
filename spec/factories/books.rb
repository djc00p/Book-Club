FactoryBot.define do
  factory :book do
    sequence(:title) {|n| "Title #{n}"}
    pages { 305 }
    year_pub { 2006 }
    image {"https://previews.123rf.com/images/wektorygrafika/wektorygrafika1601/wektorygrafika160100003/50246517-open-book-vector-clipart-silhouette-symbol-icon-design-illustration-isolated-on-white-background-.jpg"}
    author 
  end
end
