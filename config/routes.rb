Rails.application.routes.draw do
  root to: 'top_pages#top'

  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'
  post 'guest_login', to: 'user_sessions#guest_login'
  
  resources :users, only: %i[new create]
  resources :exchanges, only: %i[index new create edit update destroy] do
    resources :messages, only: %i[index new create edit update destroy]
  end
  resources :companions, only: %i[index new create edit update destroy]
  resource :profile, only: %i[edit update]
end
