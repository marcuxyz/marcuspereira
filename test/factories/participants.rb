FactoryBot.define do
  factory :participant do
    name { Faker::Internet.name }
    email { Faker::Internet.email }
  end
end
