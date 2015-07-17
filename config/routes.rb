Rails.application.routes.draw do
  resources :users do
    collection do 
      get 'activate'
    end
  end

  resources :bands do
    resources :albums, only: [:new]
  end

  resources :albums, except: [:new] do
    resources :tracks, only: [:new]
  end

  resources :tracks, except: [:new]

  resource :session, only: [:create, :destroy, :new]

  resources :notes
end
