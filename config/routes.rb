Rails.application.routes.draw do
  resources :users
  resources :events
  resources :users, except: [:new]
  root 'pages#home'
  get 'signup', to: 'users#new'
  get 'pages/home', to: 'pages#home'
  get 'about', to: 'pages#about'
end
