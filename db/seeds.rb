class ApplicationRecord
  after_commit -> { print "." }
end

ActiveRecord::Base.transaction do
  5.times do
    FactoryBot.create :user
  end

  events = []
  5.times do
    event = FactoryBot.create :event
    events << event
    FactoryBot.create :event_user, event: event, user: User.all.sample, role: 'creator'
  end

  events.each do |event|
    FactoryBot.create_list(:image, 3, event: event, event_user: event.creator )
  end
end


