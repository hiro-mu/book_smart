FactoryBot.define do
  factory :highlight do
    text      { "aaa" }
    pagenum   { 1 }
    association :book
  end
end
