class OrdersController < ApplicationController

  def index
  end

  def new
    @order = Order.new
    @order.address = current_customer.address
    @order.name = current_customer.first_name
  end

  def create
    order = Order.new(order_params)
    order.customer_id = current_customer.id
    if order.save!
      redirect_to orders_thanks_path
    else
      @order = Order.new(order_params)
      render :new
    end
  end

  def confirm
    @order = Order.new(order_params)
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
