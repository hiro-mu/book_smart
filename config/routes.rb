Rails.application.routes.draw do
  root to: 'books#index'
  resources :books, only: [:new, :create, :show] do
    resources :pages, only: [:show, :create, :update]
  end
  get 'pages', to: 'pages#highlight'
  get 'pages/load', to: 'pages#load'
  get 'pages/delete', to: 'pages#delete'
end
