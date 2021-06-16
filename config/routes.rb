Rails.application.routes.draw do
  devise_for :users
  get 'animals/index'
  root to: "animals#index"
  resources :animals, only: [:new, :create, :show, :update, :edit, :destroy] do
    resources :rooms, only: [:create,:show,:new] do
      resources :messages, only: [:create]
    end
  end
end