Rails.application.routes.draw do

  namespace :questions do
    get 'welcome/index'
  end

  namespace :admins do
    get 'welcome/index' # Dashboard
    resources :users    # Usuários
  end

  namespace :admin do
  end

  devise_for :users
  
  resources :entrances
  resources :companies
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  devise_scope :user do
    get 'admin', to: 'admins/welcome#index'
  end

  get "admin", to: "admins/welcome#index"

  root 'questions/welcome#index'
  # Defines the root path route ("/")
  # root "articles#index"
end
