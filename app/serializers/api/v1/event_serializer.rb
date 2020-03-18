class Api::V1::EventSerializer < Api::V1::BaseSerializer
  attributes :name, :event_date, :created_at, :updated_at

  has_many :event_users
end
