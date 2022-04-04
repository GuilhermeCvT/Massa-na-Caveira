Rails.application.routes.draw do
  get 'questionnaire/index'

  namespace :questionnaire do
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
  resources :questions
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  devise_scope :user do
    get 'admin', to: 'admins/welcome#index'
  end

  get "admin", to: "admins/welcome#index"

  root 'questionnaire/welcome#index'
  # Defines the root path route ("/")
  # root "articles#index"
end
