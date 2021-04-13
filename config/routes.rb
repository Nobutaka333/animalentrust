Rails.application.routes.draw do
  devise_for :users
  get 'animals/index'
  root to: "animals#index"
  resources :animals, only: [:new, :create, :show, :update, :edit, :destroy]
end
