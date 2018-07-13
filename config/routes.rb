Rails.application.routes.draw do
  devise_for :users
  root 'articles#index'
  get 'articles' => 'articles#index'
  get 'articles/new' => 'articles#new'
  post 'articles' => 'articles#create'
  delete 'articles/:id' => 'articles#destroy'
  get 'articles/:id/edit' => 'articles#edit'
  patch 'articles/:id' => 'articles#update'

end
