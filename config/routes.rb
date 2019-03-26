Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'

  resources :reviews, only: [:destroy]

  resources :books, only: [:index, :show, :new, :create] do
    resources :reviews, only: [:new, :create]
  end

  get '/user/:id', to: "users#show", as: 'user'

end
