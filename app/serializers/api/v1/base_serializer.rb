class Api::V1::BaseSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
end
