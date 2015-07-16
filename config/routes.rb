Rails.application.routes.draw do
  resources :users
  resource :sessions, only: [:new, :create]
end
