Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  resources :users, only: [:create]
  resources :sessions, only: [:create, :destroy]
  resources :transactions, only: [:create]
  get 'stock_prices/:symbol', to: 'stock_prices#show'
  get 'stock_prices', to: 'stock_prices#index'
  get 'stock_prices/all', to: 'stock_prices#all'
  # Defines the root path route ("/")
  # root "posts#index"
end
