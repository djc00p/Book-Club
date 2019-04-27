Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'

  # resources :reviews, only: [:destroy]
  delete '/reviews/:id', to: 'reviews#destroy', as: 'review'

  # resources :books, only: [:index, :show, :new, :create, :destroy] do
  #   resources :reviews, only: [:new, :create]
  # end
  get '/books', to: 'books#index', as: 'books'

  post '/books', to: 'books#create'

  get '/books/new', to: 'books#new', as: 'new_book'

  delete 'books/:id', to: 'books#destroy', as: 'book'
  get '/books/:id', to: 'books#show'


  get '/books/:book_id/reviews/new', to: 'reviews#new', as: 'new_book_review'
  post 'books/:book_id/reviews', to: 'reviews#create', as: 'book_reviews'

  # resources :authors, only: [:show, :destroy]
  get '/authors/:id', to: 'authors#show', as: 'author'
  delete '/authors/:id', to: 'authors#destroy', as: 'authors'

  # can't turn this into resources since there's no
  # users table in the db
  get '/user/:id', to: "users#show", as: 'user'

end
