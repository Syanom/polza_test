Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root 'menu_orders#new'

  get 'kitchen/orders_to_cook', to: 'kitchen#orders_to_cook'

  resources :menu_orders, only: %i[new create]
end
