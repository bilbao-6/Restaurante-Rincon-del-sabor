Rails.application.routes.draw do
  # get 'sales/index'
  # get 'sales/new'
  # get 'clients/index'
  # get 'clients/new'
  # get 'clients/show'
  # get 'clients/edit'
  # namespace :categories do
  #   get 'dishes/index'
  #   get 'dishes/new'
  #   get 'dishes/edit'
  #   get 'dishes/show'
  # end
  # resources :dishes
  # resources :categories
  devise_for :users
  get 'home/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "home#index"
  resources :profiles
  resources :clients
  resources :sales
  resources :categories do
    resources :dishes, module: :categories
  end
  post '/search', to: 'search#results'
end
