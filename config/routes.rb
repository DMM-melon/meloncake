Rails.application.routes.draw do
  devise_for :customers
  devise_for :admins
  namespace :admin do
    get 'order_items/update'
  end
  namespace :admin do
    get 'orders/index'
    get 'orders/show'
    get 'orders/update'
  end
  namespace :admin do
    get 'customers/index'
    get 'customers/show'
    get 'customers/edit'
    get 'customers/update'
  end
  namespace :admin do
    get 'genres/index'
    get 'genres/create'
    get 'genres/edit'
    get 'genres/update'
  end
  namespace :admin do
    get 'products/index'
    get 'products/new'
    get 'products/create'
    get 'products/show'
    get 'products/edit'
    get 'products/update'
  end
  namespace :admin do
    get 'homes/top'
  end
  get 'deliveries/index'
  get 'deliveries/create'
  get 'deliveries/destroy'
  get 'deliveries/edit'
  get 'deliveries/update'
  get 'customers/show'
  get 'customers/edit'
  get 'customers/bye'
  get 'customers/update'
  get 'customers/update_dl'
  get 'orders/create'
  get 'orders/index'
  get 'orders/new'
  get 'orders/confirm'
  get 'orders/show'
  get 'orders/thanks'
  get 'cart_items/create'
  get 'cart_items/index'
  get 'cart_items/update'
  get 'cart_items/destroy'
  get 'cart_items/destroy_all'
  get 'products/index'
  get 'products/show'
  get 'homes/top'
  get 'homes/about'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
