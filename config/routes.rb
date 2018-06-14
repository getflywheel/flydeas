Rails.application.routes.draw do
	resources :logins, only: %i(new create) do
	end
	resources :account_activations, only: [:edit] do
	end
end
