Rails.application.routes.draw do

  devise_for :users, skip: :all

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      # Authentication
      scope 'auth' do
        use_doorkeeper scope: '' do
          skip_controllers :authorizations, :applications,
            :authorized_applications
        end

        devise_scope :user do
          post '/', to: 'registrations#create', as: :sign_up
        end
      end

      root 'home#index'
      get '/me', to: 'users#me'
    end
  end
end
