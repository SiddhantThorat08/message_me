Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'chatroom#index'
  get 'login', to: 'sessions#new'
  get 'logout', to: 'sessions#destroy'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  post 'message', to: "messages#create"
  get 'signup', to: 'users#new'
  post 'signup', to: 'users#create'
  resources :users, except: [:new] 
  mount ActionCable.server, at: '/cable'
end
