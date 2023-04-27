FactoryBot.define do
  factory :post do
    title { Faker::Movie.title }
    content { Faker::Quote.matz }
    position { 1 }
    user
  end
end
