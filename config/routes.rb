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
  
  resources :events do
      member do
         get 'will'
         get 'will_create_true'
         get 'will_create_false'
       end
  end
end