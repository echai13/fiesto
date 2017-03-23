Rails.application.routes.draw do
  resources :events, :users
  root 'events#index'

  get '/home', to: 'static_pages#home'
  get '/about', to: 'static_pages#about'
  get '/contact', to: 'static_pages#contact'
  get '/signup', to: 'users#new'
  get '/signup', to: 'static_pages#home'
  get '/settings', to: 'users#settings'
  get 'events/new'
  post '/signup',  to: 'users#create'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'




end
