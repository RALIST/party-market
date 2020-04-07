class Api::V1::BaseSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :created_at, :updated_at
end
