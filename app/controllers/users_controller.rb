class Api::V1::UsersController < Api::V1::ApplicationController

  def me
    render json: current_user,
           include: '**',
           serializer: Api::V1::MeSerializer
  end
end
