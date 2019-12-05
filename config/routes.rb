Rails.application.routes.draw do

  root 'home#index'

  get 'contacts', to: 'home#show'
  get 'planner', to: 'home#planner'


end
