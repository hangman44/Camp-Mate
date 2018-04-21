Rails.application.routes.draw do
  resources :users
  root 'pages#home'
  get 'pages/home', to: 'pages#home'
  get 'about', to: 'pages#about'
end
