FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { 'testecase123' }
  end
end
