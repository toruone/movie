Rails.application.routes.draw do
  devise_for :users
  root to: "works#index"
  get "home/index"

  resources :directors, only: [:index, :show]
  resources :works, only: [:index, :show] do
    get "higher" => "works#move_higher", as: "higher", on: :member
  end

  namespace :login do
    resources :works, only: [:new, :create, :edit, :update, :destroy]
    resources :directors, only: [:new, :create, :edit, :update, :destroy]
    resource :profile, only: [:create, :edit, :update]
  end
  

end
