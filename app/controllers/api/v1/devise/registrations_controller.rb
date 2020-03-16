class Api::V1::Devise::RegistrationsController < Devise::RegistrationsController
  skip_before_action :authenticate_user!

  def create
    build_resource(sign_up_params)
    resource.save!
    render json: resource, status: :created
  end

  private

  def sign_up_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
