Rails.application.routes.draw do
  get 'chefs/new'
  get 'chefs/create'
  get 'chefs/edit'
  get 'chefs/update'
  get 'chefs/delete'
  get 'sessions/new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root   'static_pages#home'
  get    '/chef_home',to: 'static_pages#chef_home'
  get    '/user_home',to: 'static_pages#user_home'
  get    '/signup',  to: 'users#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  resources :users
end
