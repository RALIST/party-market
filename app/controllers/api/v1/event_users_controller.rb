class Api::V1::EventUsersController < ApplicationController

  def create
    participant = event.event_users.create!(user_params)
    render json: participant, status: :create
  end
end
