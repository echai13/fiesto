Rails.application.routes.draw do
  resources :events, :users
  get 'users/new'
  get 'events/new'
  root 'events#index'
end
