AuthDemo::Application.routes.draw do
  root to: "users#show"

  resource :session, only: [:create, :destroy, :new]
  resource :user, only: [:create, :new, :show] do
    resource :counter, only: :update
  end

  resources :pets
  resources :pet_follows, only: [:create, :destroy]
end
