Rails.application.routes.draw do
  devise_for :customers
  devise_for :admins
  namespace :admin do
    resources :order_items
  end
  namespace :admin do
    resources :orders
  end
  namespace :admin do
    resources :customers
  end
  namespace :admin do
    resources :genres
  end
  namespace :admin do
    resources :products
  end
  namespace :admin do
    root to: 'homes#top'
  end
  resources :deliveries

  resources :customers

  get 'orders/confirm'
  resources :orders
   
  resources :cart_items

  resources :products

  root to: 'homes#top'
  get 'homes/about'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
