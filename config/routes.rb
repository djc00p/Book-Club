Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'

  #Reviews
  delete '/reviews/:id', to: 'reviews#destroy', as: 'review'

  #BookReviews
  post 'books/:id/reviews', to: 'reviews#create', as: 'book_reviews'
  get 'books/:id/reviews/new', to: 'reviews#new', as: 'new_book_review'

  #Books
  get '/books', to: 'books#index', as: 'books'
  post '/books', to: 'books#create'
  get '/books/new', to: 'books#new', as: 'new_book'
  get '/books/:id', to: 'books#show', as: 'book'
  delete '/books/:id', to: 'books#destroy'

  #Authors
  get '/authors/:id', to: 'authors#show', as: 'author'
  delete '/authors/:id', to: 'authors#destroy'

  # resources :reviews, only: [:destroy]
  #
  # resources :books, only: [:index, :show, :new, :create, :destroy] do
  #   resources :reviews, only: [:new, :create]
  # end
  #
  # resources :authors, only: [:show, :destroy]

  get '/user/:id', to: "users#show", as: 'user'
end
