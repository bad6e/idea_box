Rails.application.routes.draw do
  root to: 'sessions#new'
  resources :ideas

  namespace "admin" do
    resources :categories
  end

  resources :categories
  resources :users, only: [:new, :create]

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#delete'
  delete '/logout', to: 'sessions#delete'

  get '/profile', to: "categories#index"
end
