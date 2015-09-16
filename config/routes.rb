Rails.application.routes.draw do
  root to: 'sessions#new'
  resources :ideas
  resources :categories
  resources :users, only: [:new, :create, :show]

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#delete'
  delete '/logout', to: 'sessions#delete'
end
