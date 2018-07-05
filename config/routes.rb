Rails.application.routes.draw do
	root :to =>'submissions#index'
  resources :submissions do
     resources :votes
  end
  resources :categories, only: [:show]
  resources :account_activations
  default_url_options :host => "localhost"
  resources :password_resets, only: [:new, :create, :edit, :update]
  # Log in and log out routes
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  resources :logins, only: %i(new create)
end
