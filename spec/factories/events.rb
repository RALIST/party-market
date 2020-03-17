FactoryBot.define do
  factory :event do
    name { Faker::Superhero.name }
    event_date { Time.current + rand(10).days }
  end
end
