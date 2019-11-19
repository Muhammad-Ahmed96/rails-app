Rails.application.routes.draw do
  # get 'categories/index'
  # get 'categories/show'
  # get 'categories/new'
  # get 'categories/edit'
  root 'products#index'
  devise_for :users
  resources :products do
    member do
      get 'add_to_cart'
    end
  end
  resources :categories
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
