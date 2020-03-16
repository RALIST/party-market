class Api::V1::HomeController < Api::V1::ApplicationController

  def index
    render json: { message: current_user.email }
  end
end
