Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # resources :users
  # get '/users', to: 'users#index', as: 'all_users'
  # get '/users/new', to: 'users#new', as: 'new_user'
  # get '/users/:id', to: 'users#show'
  # get '/users/:id/edit', to: 'users#edit'
  # post '/users', to: 'users#create'
  # patch '/users/:id', to: 'users#update'
  # put '/users/:id', to: 'users#update'
  # delete '/users/:id', to: 'users#destroy'

  resources :users, only: [:index, :show, :update, :destroy, :create] do
    resources :artworks, only: [:index]
  end

  resources :artworks, only: [:show, :update, :destroy, :create]

  resources :artwork_shares, only: [:create, :destroy] 
end
