Rails.application.routes.draw do
  root to: 'categories#index'
  resources :ideas
  resources :categories

end
