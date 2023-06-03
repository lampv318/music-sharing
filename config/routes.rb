Rails.application.routes.draw do
  get "home/index"
  root to: "home#index"

  get 'signup' => 'users#new'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'

  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  resources :users
  resources :shared_videos, only: %i( index new create )

  get "/*page" => "home#show"
end
