Rails.application.routes.draw do
  get "home/index"
  root to: "home#index"

  get 'signup' => 'users#new'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'

  resources :users
end
