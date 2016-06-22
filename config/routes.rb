Rails.application.routes.draw do
  get 'schedules/new'

  root to: 'static_pages#home'
  get 'signup', to: 'users#new'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  resources :users
  resources :events
  resources :sessions, only: [:new, :create, :destroy]
  resources :schedules
  resources :static_pages
end