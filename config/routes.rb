Rails.application.routes.draw do
  get 'password_resets/new'

  get 'password_resets/edit'

  get 'password_resets/new'

  get 'password_resets/edit'

  get 'password_resets/new'

  get 'password_resets/edit'

  get 'password_resets/new'

  get 'password_resets/edit'

  resources :logins, only: %i(new create) do
  end
    
  resources :password_resets, only: [:new, :create, :edit, :update]
end
