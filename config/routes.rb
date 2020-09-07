Rails.application.routes.draw do
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  get 'users/new'
  get 'users/create'
  get 'users/update'
  get 'users/destroy'
  get 'categories/new'
  get 'categories/index'
  get 'categories/show'
  get 'categories/create'
  get 'categories/update'
  get 'categories/edit'
  get 'articles/new'
  get 'articles/index'
  get 'articles/show'
  get 'articles/create'
  get 'articles/update'
  get 'articles/destroy'
  get 'home/index'
  get 'home/new'
  get 'home/show'
  
  resources :articles do
  resources :votes
  end
  resources :categories
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # root to: 'home#index'
  
end
