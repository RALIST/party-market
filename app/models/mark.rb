class Mark < ApplicationRecord
  belongs_to :image
  belongs_to :event_user
  has_one :user, through: :event_user, source: :user
  belongs_to :actor, class_name: 'EventUser', foreign_key: :actor_id
end
