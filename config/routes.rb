Twitterclone::Application.routes.draw do
  get "login" => "sessions#new"
  post "login" => "sessions#create"

  get "logout" => "sessions#destroy", as: "logout"

  resources :users
  resources :sessions
  root "users#index"
end
