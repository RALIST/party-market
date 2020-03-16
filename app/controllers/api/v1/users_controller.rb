class Api::V1::UsersController < ApplicationController

  def me
    render json: current_user,
           include: '**',
           serializer: Api::V1::MeSerializer
  end
end
