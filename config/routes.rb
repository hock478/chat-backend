Rails.application.routes.draw do
  resources :follows
  resources :messages
  resources :groups
  resources :group_users
  resources :users

  post '/login', to: 'auth#create'
  get '/decode_token', to: 'users#profile'
  get '/specific/:username', to: 'users#specific'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
