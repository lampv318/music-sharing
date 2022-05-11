Rails.application.routes.draw do
  get "home/index"
  get 'signup' => 'users#new'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  resources :users
  resources :shared_videos, only: %i( index new create )

  root to: "home#index"
end
