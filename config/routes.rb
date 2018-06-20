Rails.application.routes.draw do

  # Log in and log out routes
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :logins, only: %i(new create) do
  end
end
