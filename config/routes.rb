StoreEngine::Application.routes.draw do
  
  resource :cart
  resources :cart_items
  get "logout" => "sessions#destroy", :as => "logout"
  get "login" => "sessions#new", :as => "login"
  get "signup" => "users#new", :as => "signup"
  get "one_click" => "orders#one_click", :as => "one_click"
  get "code" => "application#code"
  post "search_admin" => "searches#admin_show", as: "admin_search"

  resources :users
  resources :sessions
  resources :products
  resources :categories
  resources :orders
  resources :order_items, :only => :update
  resources :customers
  resource :search

  root :to => 'products#index'
end