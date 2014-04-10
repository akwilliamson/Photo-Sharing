PhotoSharing::Application.routes.draw do
  root :to => 'users#index'
  resources :users
  resources :sessions
  resources :photos
  resources :tags
  resources :favorites
end
