Rails.application.routes.draw do
  devise_for :users
  root to: 'books#index'
  resources :books, only: [:new, :create, :show] do
    resources :pages, only: [:show] do
      member do
        get 'search'
      end
    end
    resources :bookmarks, only: [:create, :update]
  end
  get 'highlights/create', to: 'highlights#create'
  get 'highlights/load', to: 'highlights#load'
  get 'highlights/delete', to: 'highlights#delete'
end
