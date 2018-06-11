Rails.application.routes.draw do
  #get "logins/new"
  resources :logins, only: %i(new) do
  end
end
