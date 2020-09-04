Rails.application.routes.draw do
  get 'articles/index'
  get 'articles/create'
  get 'articles/new'
  get 'article/index'
  get 'article/article'
  devise_for :users
  resources :articles do
  resources :votes
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "home#index"
  
end
