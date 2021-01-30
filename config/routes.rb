Rails.application.routes.draw do
  root to: 'books#index'
  resources :books, only: [:new, :create, :show] do
    resources :pages, only: [:show, :create, :update]
  end
end
