Rails.application.routes.draw do
  get 'tags/show'
  devise_for :users
  root to: "works#index"
  get "home/index"

  resources :directors, only: [:index, :show]
  resources :works, only: [:index, :show] do
    get "higher" => "works#move_higher", as: "higher", on: :member
  end
  resources :tags, only: [:show]
  
  namespace :login do
    resources :works, only: [:new, :create, :edit, :update, :destroy]
    resources :directors, only: [:new, :create, :edit, :update, :destroy]
    resource :profile, only: [:create, :edit, :update]
  end


end
