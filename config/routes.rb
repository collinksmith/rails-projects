AuthDemo::Application.routes.draw do
  root to: "users#show"

  resource :session, only: [:create, :destroy, :new]
  resource :user, only: [:create, :new, :show] do
    resource :counter, only: :update
  end

  resources :pets
  resources :pet_follows, only: [:create, :destroy]

  get 'home', to: 'static_pages#home'
  get 'contact', to: 'static_pages#contact'
  get 'about', to: 'static_pages#about'
end
