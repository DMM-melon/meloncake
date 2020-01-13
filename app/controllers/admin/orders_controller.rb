class Admin::OrdersController < ApplicationController
  def index
    if params[:button].to_i == 1 # ヘッダーから
  		@orders = Order.all
  	elsif params[:button].to_i == 2 #会員詳細から
  		@customer = Customer.find(params[:id])
  	  	@orders = @customer.orders.all
    else #トップページから
    	@orders = Order.where("created_at >= ?", Time.zone.now.beginning_of_day)
    end
  end

  def show
  	@order = Order.find(params[:id])
  	@order_items = @order.order_items.all
    @tax = 1.08
    @carriage = 800
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    redirect_to admin_orders_path
  end
end

# <%= link_to "注文履歴", admin_orders_path, {button: 1} %> ヘッダーに記載
# <%= link_to "会員名", admin_orders_path, {button: 2} %> 会員詳細に記載
# <%= link_to "件数", admin_orders_path %> トップページに記載