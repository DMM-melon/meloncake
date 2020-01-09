class Admin::OrdersController < ApplicationController
  def index
  	@orders = Order.all
  end

  def show
  	@order = Order.find(params[:id])
  	@order_item = @order.order_items.all
  end

  def update
  end
end
