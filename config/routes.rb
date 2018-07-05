Rails.application.routes.draw do
	root :to => "submissions#index"
	default_url_options :host => "localhost"

	# Resources
	resources :submissions do
		resources :votes
	end
	resources :logins, only: %i[new create] # Sign up resource
	resources :account_activations, only: %i[edit]
	resources :password_resets, only: %i[new create edit update]

	# Nice session control routes 
	get "/login", to: "sessions#new"
	post "/login", to: "sessions#create"
	delete "/logout", to: "sessions#destroy"
end  
