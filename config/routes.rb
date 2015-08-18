Rails.application.routes.draw do
  get 'home/index'
  devise_for :users

  resources :registered_applications

  namespace :api, defaults: { format: :json } do
    match 'create_event', to: 'events#create', via: [:options]
    resources :events, only: [:create]
  end


  authenticated :user do
    root to: "registered_applications#index", as: :authenticated_root, via: :get
  end

  unauthenticated do
    root 'home#index'
  end



end
