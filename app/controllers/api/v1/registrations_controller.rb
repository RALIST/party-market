class Api::V1::RegistrationsController < Devise::RegistrationsController

  def create
    build_resource(sign_up_params)
    resource.save!
    render json: resource,
           serializer: Api::V1::UserSerializer,
           status: :created
  end

  private

  def sign_up_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
