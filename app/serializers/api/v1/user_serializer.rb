class Api::V1::UserSerializer < Api::V1::BaseSerializer
  attributes :id, :first_name, :last_name, :full_name, :created_at, :updated_at
  attribute :avatar, if: -> { object.avatar.attached? }

  def avatar
    {
      small: small,
      medium: medium,
      large: large
    }
  end

  def small
    variant = object.avatar.variant(resize_to_fill: %w(100 100))
    rails_representation_url(variant, only_path: true)
  end

  def medium
    variant = object.avatar.variant(resize_to_fill: %w(200 200))
    rails_representation_url(variant, only_path: true)
  end

  def large
    variant = object.avatar.variant(resize_to_fill: %w(300 300))
    rails_representation_url(variant, only_path: true)
  end
end
