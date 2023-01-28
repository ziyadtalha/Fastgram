Rails.application.routes.draw do

  devise_for :users, controllers: { registrations: 'users/registrations' }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get "about", to: "about#index"

  get "create_post", to: "posts#new", as: 'creat_post'
  post "create_post", to:"posts#create"

  get 'users/:id', to: 'posts#index', as: 'view_profile'

  #'as': is needed because if plural term like posts is used then url gets .id instead of /id
  get 'view_posts/:id', to: 'posts#view', as: 'view_post'
  get 'view_post/:id', to: 'posts#edit', as: 'edit_post'

  patch "view_post/:id", to: 'posts#update'
  delete 'view_posts/:id', to: 'posts#destroy', as: 'delete_post'

  resources :comments

  resources :likes

  resources :follows

  root to: "main#index"

  #viewing public feed
  get "explore", to: "main#public"

  #viewing followed users feed
  get "following", to: "main#following"

  #viewing a (public) post (REDUNDANT I think)
  #get 'public_posts/:id', to: 'posts#public', as: 'view_public_post'

  get "users/:id/followers", to: 'follows#showFollowers', as: 'view_followers'
  get "users/:id/following", to: 'follows#showFollowing', as: 'view_following'

  post "users/:id", to: "follows#cancel"

  get "search", to: "searchs#index"

end
