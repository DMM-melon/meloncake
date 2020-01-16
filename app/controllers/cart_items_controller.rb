class CartItemsController < ApplicationController
  before_action :authenticate_customer!
  skip_before_action :authenticate_customer!, only: [:index]
  def create
      # cart = CartItem.new(cart_params)
      # cart.customer_id = current_customer.id
      #3.4行目を6行目にまとめた
#      if params[:cart_item][:quantity]
      if params[:cart_item][:quantity].present?
        cart = current_customer.cart_items.find_by(product_id: params[:cart_item][:product_id])
        if cart
          cart.quantity += params[:cart_item][:quantity].to_i
        else
          cart = current_customer.cart_items.new(cart_params)
        end
        cart.save
        redirect_to cart_items_path
      else
          flash[:notice] ="個数を選択してください。"
          redirect_to product_path(params[:cart_item][:product_id])
      end
  end

  def index
      @carts = current_customer.cart_items.all
      @tax = 1.08
      @sum = 0
  end

  def update
      @cart_item = CartItem.find(params[:id])
      @cart_item.quantity = params[:cart_item][:quantity]
      @cart_item.save
      redirect_to cart_items_path
  end

  def destroy
      cart = CartItem.find(params[:id])
      cart.destroy
      redirect_to cart_items_path
  end

  def destroy_all
      carts = CartItem.all
      carts.destroy_all
      redirect_to cart_items_path
  end

 private
  def cart_params
    params.require(:cart_item).permit(:quantity, :product_id,product_id: params[:product_id])
  end
end

