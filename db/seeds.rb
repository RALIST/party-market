

10.times do
  FactoryBot.create :user
end

10.times do
  event = FactoryBot.create :event
  FactoryBot.create :event_user, event: event, user: User.all.sample, role: 'owner'
end
