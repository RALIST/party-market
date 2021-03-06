class ApplicationController < ActionController::API
  include ErrorsHandler
  respond_to :json
  before_action :authenticate_user!
  private

  def authenticate_user!
    auth = Authentication.new(token)
    if auth.user_from_token.present?
      @current_user = auth.user_from_token
    else
      render json: { errors: 'You have to sign in or sign up before continuing' }, status: :unauthorized
    end
  end

  def token_from_request_headers
    token = request.headers['Authorization']&.split
    token&.last if token&.first == 'Bearer'
  end

  def token
    @token ||= params[:jwt_token] || token_from_request_headers
  end

  def current_user
    @current_user
  end
end
