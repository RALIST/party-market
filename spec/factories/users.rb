FactoryBot.define do
  factory :user do
    email { Faker::Internet.safe_email }
    password { 'test12345' }
    confirmed_at { Time.now }
    first_name { Faker::Name.first_name}
    last_name { Faker::Name.last_name }

    trait :unconfirmed do
      confirmed_at { nil }
    end
  end
end
