class Api::V1::EventSerializer < Api::V1::BaseSerializer
  attributes :name, :event_date, :created_at, :updated_at

  has_many :users, each_serializer: Api::V1::UserSerializer do
    object.event_users.map(&:user)
  end
end
