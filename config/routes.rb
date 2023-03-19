Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  namespace :api do
    namespace :v1 do
      post "users", to: "users#create"
      post "users/login", to: "users#login"
      delete "users/logout", to: "users#logout"
      get "users/me", to: "users#me"
    end
  end
end
