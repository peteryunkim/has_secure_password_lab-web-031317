Rails.application.routes.draw do
  
  get '/signup', to: 'users#new', as: :signup
  post '/users', to: 'users#create'
  get '/users/:id', to: 'users#show', as: :user_page
 

  get '/login', to: 'sessions#new', as: :login
  post '/sessions', to: 'sessions#create'
  get '/logout', to: 'sessions#delete', as: :logout


end
