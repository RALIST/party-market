class EventUser < ApplicationRecord
  belongs_to :user
  belongs_to :event

  has_many :images

  enum role: { creator: 'creator',
               admin: 'admin',
               manager: 'manager',
               user: 'user',
               owner: 'owner' }
end
