class OrdersController < ApplicationController

  def index
  end

  def new
    @order = Order.new
  end

  def create
   
  end

  def confirm
    # order = Order.new(order_params)
  end

  def show
  end

  def thanks
  end

  private
  def order_params
      params.require(:order).permit(:payment, :name, :postcode, :address)
  end
end
