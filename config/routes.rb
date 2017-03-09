Rails.application.routes.draw do
  resources :events, :users
  get '/signup', to: 'users#new'
  get 'events/new'
  root 'events#index'
  post '/signup',  to: 'users#create'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'


end
