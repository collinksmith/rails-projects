Rails.application.routes.draw do
  
  get 'articles/month/:month' => 'articles#month', as: :month

  root to: 'articles#index'
  resources :articles do
    resources :comments
  end
  resources :tags
  resources :authors
  resources :author_sessions, only: [ :new, :create, :destroy ]

  get 'login' => 'author_sessions#new'
  get 'logout' => 'author_sessions#destroy'

end
