FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    username { Faker::Name.name }
    btc { "0.1" }
    usd { "1000" }
    password { Faker::Internet.password }
  end
end
