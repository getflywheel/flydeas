Rails.application.routes.draw do
  resources :logins, only: %i(new create) do
  end
end
