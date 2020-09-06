Rails.application.routes.draw do
  get 'home/index'
  get 'home/new'
  get 'home/show'
  devise_for :users
  resources :articles do
  resources :votes
  end
  resources :categories
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'home#index'
  
end
