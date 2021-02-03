Rails.application.routes.draw do
  root to: 'books#index'
  resources :books, only: [:new, :create, :show] do
    resources :pages, only: [:show, :create, :update]
    resources :bookmarks, only: [:create, :update]
  end
  get 'highlights/create', to: 'highlights#create'
  get 'highlights/load', to: 'highlights#load'
  get 'highlights/delete', to: 'highlights#delete'
end
