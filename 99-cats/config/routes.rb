Rails.application.routes.draw do
  root to: "cats#index"

  resources :cats

  resources :cat_rental_requests do
    member do
      get 'approve'
      get 'deny'
    end
  end
end
