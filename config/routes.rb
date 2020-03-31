Rails.application.routes.draw do
  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
  devise_for :users
  namespace :admin do
    resources :posts, except: [:show]
    end
  resources :posts
  resources :collections
  resources :items
  resources :tags, only: [:show]
  resources :posts, shallow: true do
    resources :items
  end
  root to: 'posts#index'
  get '/users/index', as: 'all_users'
  get '/users/update', as: 'update_users'
  get 'search', to: 'items#search'
  resources :users
  end
end
