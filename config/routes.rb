Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      # Authentication
      scope 'auth' do
        use_doorkeeper scope: '' do
          skip_controllers :authorizations, :applications,
            :authorized_applications
        end
        devise_for :users,
                   path: '',
                   controllers: {
                     registrations: 'api/v1/devise/registrations'
                   }
      end

      root 'home#index'

      get '/me', to: 'users#me'
    end
  end
end
