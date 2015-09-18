Rails.application.routes.draw do
  root to: 'sessions#new'
  resources :ideas

  namespace "admin" do
    resources :categories
    resources :images
  end

  resources :users, only: [:new, :create, :show]


  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#delete'
  delete '/logout', to: 'sessions#delete'

  get '/profile', to: "ideas#index"
end
