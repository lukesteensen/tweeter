Tweeter::Application.routes.draw do

  resources :posts
  resources :users
  resources :sessions
  resources :followings

  get "logout" => "sessions#destroy", :as => "logout"
  get "login" => "sessions#new", :as => "login"
  get "signup" => "users#new", :as => "signup"

  root to: 'posts#index'

end
