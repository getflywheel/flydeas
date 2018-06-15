Rails.application.routes.draw do
    resources :account_activations, only: [:edit] do
    end
    default_url_options :host => "localhost"

    resources :logins, only: %i(new create) do
    end
    
    resources :password_resets, only: [:new, :create, :edit, :update]
end
