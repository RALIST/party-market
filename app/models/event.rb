class Event < ApplicationRecord
  has_many :event_users, dependent: :restrict_with_error
  has_many :images, through: :event_users
  has_many :resource_tags, as: :resource
  has_many :tags, through: :resource_tags

  has_many :owners, -> { owner }, class_name: 'EventUser'
  has_many :users, -> { user }, class_name: 'EventUser'
  has_many :admins, -> { admin }, class_name: 'EventUser'
  has_one :creator, -> { creator }, class_name: 'EventUser'
end
