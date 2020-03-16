class Api::V1::MeSerializer < Api::V1::BaseSerializer
  attributes :email, :created_at, :updated_at, :token, :refresh_token

  def token
    object.access_tokens.last.token
  end

  def refresh_token
    object.access_tokens.last.refresh_token
  end

end
