Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "user/omniauth_callbacks" }
  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
    # get 'authentications#create'
    namespace :admin do
      resources :posts, except: [:show]
    end
    namespace :users do
      resources :posts
    end
    resources :collections
    resources :items
    resources :tags, only: [:show, :index]
    resources :posts, shallow: true do
      resources :items
    end
    root to: 'posts#index'
    get '/users/collections', as: 'user_collections'
    get '/users/index', as: 'all_users'
    get '/users/update', as: 'update_users'
    get 'search', to: 'items#search'
    resources :users
  end
end
