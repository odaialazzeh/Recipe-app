Rails.application.routes.draw do
  devise_for :users
  root "recipes#index"
  get '/inventories', to: 'inventories#index'
  get '/inventories/new', to: 'inventories#new'
  post '/inventories', to: 'inventories#create'
  get '/inventories/:id', to: 'inventories#show'
  delete '/inventories/:id', to: 'inventories#destroy'

  get '/inventories/:id/inventory_foods/new', to: 'inventory_foods#new'
  post '/inventories/:id/inventory_foods', to: 'inventory_foods#create'
  delete '/inventory_foods/:id', to: 'inventory_foods#destroy'
  resources :users do
    resources :foods, only: [:index, :show, :new, :create, :destroy]
  end
  delete '/recipes/:id', to: 'recipes#destroy', as: 'recipe'
  resources :recipes, only: [:index, :show, :new, :create, :destroy]
end
