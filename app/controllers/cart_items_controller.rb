class CartItemsController < ApplicationController
  def create
      # cart = CartItem.new(cart_params)
      # cart.customer_id = current_customer.id
      #3.4行目を6行目にまとめた
      cart = current_customer.cart_items.find_by(product_id: params[:cart_item][:product_id])
      if cart
        cart.quantity += params[:cart_item][:quantity].to_i
      else
        cart = current_customer.cart_items.new(cart_params)
      end
      cart.save

      redirect_to cart_items_path
  end

  def index
      @carts = current_customer.cart_items.all
      @tax = 1.08
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

