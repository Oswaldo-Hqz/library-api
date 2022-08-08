Rails.application.routes.draw do
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do

      resources :books
      resources :genres
      resources :roles

      resources :borrowings, only: [:index, :show, :create, :update, :destroy]
      post "/return_book", to: "borrowings#return_book"
      post "/borrowed_books_by_userid/:id", to: "borrowings#borrowed_books"

      resources :users, only: [:index, :create]
      get "/profile/:id", to: "users#profile"
      get "/user_by_Email", to: "users#user_by_Email"
      post "/login", to: "auth#login"
      get "/auto_login", to: "auth#auto_login"
      get "/user_is_authed", to: "auth#user_is_authed"
    end
  end
  
  # Defines the root path route ("/")
  root "root#index"
end
