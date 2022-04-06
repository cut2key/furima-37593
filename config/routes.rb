Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  resources :items
  #root to: "purchases#index"
  resources :purchases, only: :index
end
