Rails.application.routes.draw do
	mount Ckeditor::Engine => "/ckeditor"
	root :to => "submissions#index"
	default_url_options :host => "localhost"

	# Resources
	resources :submissions do
		resource :vote, only: %i[update]
		resources :comments do
			resource :vote, only: %i[update]	
		end

	end
	resources :categories, only: [:show]
	# Sign up resource
	resources :logins, only: %i[new create] 
	resources :account_activations, only: %i[edit]
	resources :password_resets, only: %i[new create edit update]

	# Named session control routes 
	get "/login", to: "sessions#new"
	post "/login", to: "sessions#create"
	delete "/logout", to: "sessions#destroy"
end  
