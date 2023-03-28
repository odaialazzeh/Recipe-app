Rails.application.routes.draw do
  devise_for :users
  root 'public_recipes#index'
  resources :users do
    resources :foods, only: [:index, :show, :new, :create, :destroy]
  end
end
