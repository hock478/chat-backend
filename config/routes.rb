Rails.application.routes.draw do
  resources :follows
  resources :messages
  resources :groups
  resources :group_users
  resources :users
  resources :likes
  resources :posts

  post '/login', to: 'auth#create'
  get '/decode_token', to: 'users#profile'
  get '/specific/:username', to: 'users#specific'
  get '/following_posts/:id', to: 'posts#following_posts'
  post '/like_destroy', to: 'likes#like_destroy'
  post '/delete_fol', to: 'follows#delete_fol'
  post '/delete_user', to: 'users#delete_user'


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
