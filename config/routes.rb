Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'

  resources :reviews, only: [:destroy]

  resources :books, only: [:index, :show, :new, :create, :destroy] do
    resources :reviews, only: [:new, :create]
  end

  resources :authors, only: [:show, :destroy]

  get '/user/:id', to: "users#show", as: 'user'

end
