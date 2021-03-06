class Api::V1::UserSerializer < Api::V1::BaseSerializer
  attributes :id, :first_name, :last_name, :full_name, :created_at, :updated_at
  attribute :avatar, if: -> { object.avatar.attached? }

  def avatar
    hash = {}
    User::VARIANTS.each do |variant, props|
      url =
        object.avatar.variant(
          props[:process] => [props[:width], props[:height]],
          auto_orient: true,
          strip: true,
          gravity: 'center',
          quality: '100%'
      ).service_url.split('?').first
      hash[:"#{variant}"] = url
    end
    hash
  end
end
