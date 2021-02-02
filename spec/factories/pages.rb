FactoryBot.define do
  factory :page do
    pagenum { 1 }
    association :book
  end
end
