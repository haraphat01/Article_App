Rails.application.routes.draw do
  get 'categories/index'
  get 'categories/new'
  get 'categories/show'
  get 'categories/create'
  get 'categories/edit'
  get 'categories/update'
  get 'categories/show'
  get 'articles/index'
  get 'articles/create'
  get 'articles/new'
  get 'article/index'
  get 'article/article'
  devise_for :users
  resources :articles do
  resources :votes
  end
  resources :categories
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'categories#index'
  
end
