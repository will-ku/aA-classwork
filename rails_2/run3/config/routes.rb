Rails.application.routes.draw do

  resources :users do
    resources :goals, only: [:create]
  end

  resource :session
  
  resources :goals, only: [:destroy]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
