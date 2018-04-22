Rails.application.routes.draw do
  resources :users
  resources :events
  resources :users, except: [:new]
  root 'pages#home'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  get 'signup', to: 'users#new'
  get 'pages/home', to: 'pages#home'
  get 'about', to: 'pages#about'
end
