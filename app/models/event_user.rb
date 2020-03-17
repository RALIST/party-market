class EventUser < ApplicationRecord
  belongs_to :user
  belongs_to :event

  enum role: { creator: 'creator',
               admin: 'admin',
               manager: 'manager',
               user: 'user',
               owner: 'owner' }
end
