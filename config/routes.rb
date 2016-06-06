Rails.application.routes.draw do
  root to: 'static_pages#landing'

  # Session routes
  get '/login', to: 'sessions#new'

  # User routes
  resources :users, only: [:new]
end
