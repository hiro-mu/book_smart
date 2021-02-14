FactoryBot.define do
  factory :book do
    title    { Faker::Book.title }
    content  { Faker::Lorem.paragraph }

    after(:build) do |book|
      book.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
    association :user
  end
end
