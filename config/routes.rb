Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root to: "wallets#index"
  resources :users, only: %i(new create)
  resources :teams, only: %i(new create)
  resources :stocks, only: %i(new create)
  resources :wallets, only: %i(index new create)
  resources :transactions, only: %i(index new create)
end
