Rails.application.routes.draw do
  resources :events, :users
  get '/signup', to: 'users#new'
  get 'events/new'
  root 'events#index'
  post '/signup',  to: 'users#create'
  resources :users


end
