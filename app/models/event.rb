class Event < ApplicationRecord
  has_many :event_users, dependent: :destroy
  has_many :tags, as: :resource

  has_many :owners, -> { owner }, class_name: 'EventUser'
  has_many :users, -> { user }, class_name: 'EventUser'
  has_many :admins, -> { admin }, class_name: 'EventUser'
  has_one :creator, -> { creator }, class_name: 'EventUser'

  has_many :images
end
