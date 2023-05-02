FactoryBot.define do
  factory :resource do
    name { Faker::Address.community }
    url { Faker::Internet.url(host: 'github.com') }
    post
  end
end
