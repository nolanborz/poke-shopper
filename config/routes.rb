Rails.application.routes.draw do
    devise_for :users

    # PWA routes
    get "manifest.json", to: "application#manifest"

    # Cart and product routes
    resource :cart, controller: :shopping_carts, only: [ :show ]
    resources :pokemon_products
    resources :orders
    resources :cart_items, only: [ :create, :destroy ]  # Added destroy

    root "home#index"
  end
