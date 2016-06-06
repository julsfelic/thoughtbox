Rails.application.routes.draw do
  root to: 'static_pages#landing'

  # Session routes
  get '/login', to: 'sessions#new'
  delete '/logout', to: 'sessions#destroy'

  resources :sessions, only: [:create]

  # User routes
  get '/signup', to: 'users#new', as: 'new_user'

  resources :users, only: [:create]

  # Links routes
  resources :links, only: [:index, :create, :update]
end
