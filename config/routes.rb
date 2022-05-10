Rails.application.routes.draw do
  get "home/index"
  get 'signup' => 'users#new'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  resources :users
  root to: "home#index"
end
