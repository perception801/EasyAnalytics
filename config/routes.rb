Rails.application.routes.draw do
  get 'home/index'
  root to: 'home#index'
  devise_for :users

  resources :registered_applications

  namespace :api, defaults: { format: :json } do
    match 'create_event', to: 'events#create', via: [:options]
    resources :events, only: [:create]
  end
end
