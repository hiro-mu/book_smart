FactoryBot.define do
  factory :bookmark do
    pagenum     { 1 }
    association :book
    association :user
  end
end