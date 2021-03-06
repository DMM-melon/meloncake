Rails.application.routes.draw do
  devise_for :customers
  devise_for :admins, controllers: {
    sessions: 'admins/sessions',
    passwords: 'admins/passwords',
    registrations: 'admins/registrations'
  }
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

  resources :customers, except: :destroy do
    member do
      get 'bye'
    end
  end
#変更しないとエラー
  get 'orders/confirm'
  post 'orders/confirm'
  get 'orders/thanks'
  post 'orders/thanks'
  resources :orders

  resources :cart_items do
    collection do
      delete 'destroy_all'
  end
  end
  resources :products

  root to: 'homes#top'
  post 'homes/search'
  get 'homes/about'
  delete 'customers/:id', to: 'customers#update_dl'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
