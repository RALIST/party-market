class Api::V1::EventUserSerializer < Api::V1::BaseSerializer
  attributes :id, :role, :created_at, :updated_at

  belongs_to :user, serializer: Api::V1::UserSerializer
end
