# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

10.times do
  FactoryBot.create :user
end

10.times do
  event = FactoryBot.create :event
  FactoryBot.create :event_user, event: event, user: User.all.sample, role: 'user'
end
