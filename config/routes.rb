Rails.application.routes.draw do

  devise_for :users
  root 'home#index'

  get 'contacts', to: 'home#show'
  get 'planner', to: 'home#planner'

  resources :locations

end
