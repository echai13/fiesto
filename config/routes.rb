Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :events, :users
  root 'events#index'

  match '/contacts',     to: 'contacts#new', via: 'get'
  resources "contacts", only: [:new, :create]

  post '/drop', to: 'users#drop'
  get '/search', to: 'events#search'
  get '/home', to: 'static_pages#home'
  get '/about', to: 'static_pages#about'
  get '/signup', to: 'users#new'
  get '/settings', to: 'users#edit'
  get '/error', to: 'users#error'
  get 'events/new'
  post '/signup',  to: 'users#create'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  get '/charges', to: 'charges#new'
  post '/charges', to: 'charges#create'
  post 'tokens' => "tokens#create"
  post '/expand', to: 'users#expand'
  get '/verify', to:'users#verify'
  post '/verify', to: 'users#verify_check'
  post '/parties', to: 'parties#review'

end
