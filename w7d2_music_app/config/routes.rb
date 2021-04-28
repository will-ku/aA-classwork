Rails.application.routes.draw do
  resources :users, only: [:index, :create, :new, :show]
  resources :sessions, only: [:create, :destroy]
  resources :bands
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
