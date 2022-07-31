Rails.application.routes.draw do
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :books
      resources :borrowings
      resources :genres
      resources :roles
      resources :users, only: [:index, :show, :create]
      post "/login", to: "auth#login"
      get "/auto_login", to: "auth#auto_login"
      get "/user_is_authed", to: "auth#user_is_authed"
    end
  end
  
  # Defines the root path route ("/")
  root "root#index"
end
