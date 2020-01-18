class OrdersController < ApplicationController
  before_action :authenticate_customer!
  before_action :no_cart_items, only: [:confirm]

  def index
    @orders = current_customer.orders.all.order(created_at: :desc)
    @tax = 1.08
  end

  def new
    @order = Order.new
  end

  def create

    tax = 1.08
    order = Order.new(order_params)
    order.customer_id = current_customer.id
## カートの中身をすべてコピー
    current_customer.cart_items.each do |item|
      order_item = order.order_items.new(
       quantity:  item.quantity,
       purchase_price:  item.product.price * tax,
       name:  item.product.name,
       order_item_status: "着手不可",
       product_id: item.product.id
        )
    end

    if current_customer.cart_items == []
      redirect_to cart_items_path
    else 
      order.save
      current_customer.cart_items.destroy_all
      redirect_to orders_thanks_path
    end
    if params[:order][:postage] == "3" 
      deliveries = Delivery.new(customer_id: order.customer.id, name: order.name, address: order.address, postcode: order.postcode)
      deliveries.save
    end
  end

  def confirm
    @tax = 1.08
    @postage = 800
    @carts = current_customer.cart_items
    @order = Order.new(order_params)

    
    if params[:order][:postage] == "1"
      @order.postcode = current_customer.postcode
      @order.address = current_customer.address
      @order.name = current_customer.last_name + current_customer.first_name
    elsif params[:order][:postage] == "2"
      delivery = Delivery.find(params[:order][:address_option])
      @order.postcode = delivery.postcode
      @order.address = delivery.address
      @order.name = delivery.name
    else 
      @error_msg= ""
       if params[:order][:postcode].blank?
          @error_msg = "郵便番号を入力してください"

       end 
       if   params[:order][:address].blank?
          @error_msg += " 住所を入力してください"
       end
       if    params[:order][:name].blank?
          @error_msg += "　宛名を入力してください"
       end
       
        if @error_msg != ""
          render :new
        end
    end
    
  end

  def show
    @tax = 1.08
    @postage = 800
    #@order = Order.find(params[:id])
    @order = Order.find_by(id:params[:id])
    if @order.customer_id != current_customer.id
      redirect_to orders_path
    end
    @order_items = @order.order_items.all
  end

  def thanks
  end

  private
  def order_params
      params.require(:order).permit(:payment, :name, :postcode, :address, :postage, :total_price)
      
  end

  def no_cart_items
    if params[:order] == []
      redirect_to new_order_path
    end

    if current_customer.cart_items == []
      redirect_to cart_items_path
    end
  end
end
