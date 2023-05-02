FactoryBot.define do
  factory :post do
    title { Faker::Movie.title }
    content { Faker::Quote.matz }
    position { 1 }
    user

    trait :with_resources do
      after(:create) { |post| create_list(:resource, 2, post:) }
    end
  end
end
