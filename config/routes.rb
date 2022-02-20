Rails.application.routes.draw do

  namespace :questions do
    get 'welcome/index'
  end

  namespace :admins do
    get 'users/index'
    get 'welcome/index'
  end

  namespace :admin do
  end

  devise_for :users
  
  resources :entrances
  resources :companies
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  devise_scope :user do
    get 'admin', to: 'devise/sessions#new'
  end

  get "admin", to: "devise/sessions#new"

  root 'questions/welcome#index'
  # Defines the root path route ("/")
  # root "articles#index"
end
