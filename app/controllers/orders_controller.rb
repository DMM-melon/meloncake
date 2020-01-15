class OrdersController < ApplicationController

  def index
    @orders = Order.all
  end

  def new
    @order = Order.new
  end

  def create
    order = Order.new(order_params)
    order.customer_id = current_customer.id
    order.save
    redirect_to orders_thanks_path
    if params[:order][:postage] == "3"
      deliveries = Delivery.new(customer_id: order.customer.id, name: order.name, address: order.address, postcode: order.postcode)
      deliveries.save

    end
  end

  def confirm
    @postage = 800
    @carts = CartItem.all
    @order = Order.new(order_params)
    
    if params[:order][:postage] == "1"
      @order.postcode = current_customer.postcode
      @order.address = current_customer.address
      @order.name = current_customer.first_name + current_customer.last_name
    elsif params[:order][:postage] == "2"
      delivery = Delivery.find(params[:order][:address_option])
      @order.postcode = delivery.postcode
      @order.address = delivery.address
      @order.name = delivery.name
    end
  end

  def show
    @order = Order.find(params[:id])
  end

  def thanks
  end

  private
  def order_params
      params.require(:order).permit(:payment, :name, :postcode, :address, :postage)
  end
end
