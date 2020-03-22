FactoryBot.define do
  factory :user do
    email { Faker::Internet.safe_email }
    password { 'test12345' }
    confirmed_at { Time.now }
    first_name { Faker::Name.first_name}
    last_name { Faker::Name.last_name }
    sequence(:avatar) { |n| fixture_file_upload Rails.root.join('spec', 'fixtures', 'images', "profile_image_#{(n%11+1).to_s.rjust(2,'0')}.jpg"), 'image/jpg', true }

    trait :unconfirmed do
      confirmed_at { nil }
    end
  end
end
