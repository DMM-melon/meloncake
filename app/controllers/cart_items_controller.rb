class CartItemsController < ApplicationController
  def create
      # cart = CartItem.new(cart_params)
      # cart.customer_id = current_customer.id
      #3.4行目を6行目にまとめた
      cart = current_customer.cart_items.new(cart_params)
      cart.save
      redirect_to cart_items_path
  end

  def index
      @carts = current_customer.cart_items.all
  end

  def update
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
    params.require(:cart_item).permit(:quantity, :product_id)
  end
end

