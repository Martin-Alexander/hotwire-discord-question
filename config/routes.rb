Rails.application.routes.draw do
  resources :apples, only: :index
  resources :grapes, only: :index
  resources :fruits, only: :index
end
