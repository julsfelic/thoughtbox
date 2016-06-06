Rails.application.routes.draw do
  root to: 'static_pages#landing'

  # Session routes
  get '/login', to: 'sessions#new'

  # User routes
  get '/signup', to: 'users#new', as: 'new_user'
end
