Rails.application.routes.draw do
  resources :stocks
  resources :transactions
  resources :products
  resources :users


  root 'pages#index'
  get "/signup", to: "users#new"
  get "/login", to:"sessions#new"
  post "/login", to:"sessions#create"
  delete "/logout", to: "sessions#destroy"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
