Rails.application.routes.draw do

  devise_for :users
  resources :events
  
  get 'user', action: :show, controller: 'users'

  namespace :admin do
    root "events#index"
    resources :events
    resources :users
  end
  
  root "events#index"
end
