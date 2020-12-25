Rails.application.routes.draw do
  devise_for :users
  root "items#index"
  resources :items do
    resources :negotiations, only: [:index] do
      resources :messages, only: [:create]
    end
  end
  resources :stores
end
