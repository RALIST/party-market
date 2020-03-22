class Api::V1::UsersController < ApplicationController

  def me
    render json: current_user,
           include: '**',
           serializer: Api::V1::MeSerializer
  end

  def index
    render json: User.all.with_attached_avatar,
           include: '**',
           status: :ok
  end

  def show; end

  def update; end

  def destroy; end
end
