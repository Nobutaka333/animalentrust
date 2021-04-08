Rails.application.routes.draw do
  get 'animals/index'
  root to: "animals#index"
end
