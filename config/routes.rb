Rails.application.routes.draw do
  resources :events
  get 'users/new'
  get 'event/new'

  root 'application#hello'
end
