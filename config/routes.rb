Rails.application.routes.draw do
  ActiveAdmin.routes self

  root "player#index"
  # get "player", to: "player#index"
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"

  scope "/songs/:song_id", as: "song" do
    resource :attachment, only: [:show, :destroy]
  end

  namespace :api, defaults: {format: 'json'} do
    resources :songs, only: [:index, :show]
    resources :albums, only: [:index, :show] do
      resources :songs, only: :index
    end
    resources :artists, only: [:index, :show] do
      resources :albums, only: :index
      resources :songs, only: :index
    end
    resources :categories, only: [:index, :show] do
      resources :albums, only: :index
    end
    resources :playlists, only: [:index, :show]
    resources :search, only: :index
    resources :users, except: :edit
    resources :current_users, only: :index
    delete :logout, to: "sessions#destroy"
    scope "/users/:user_id" do
      resources :playlists, only: [:index, :show]
    end
  end
end
