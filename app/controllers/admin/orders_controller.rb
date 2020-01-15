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
  	@order_items = OrderItem.all
    @tax = 1.08
    @carriage = 800
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    flash[:notice] = "● 注文ステータス更新しました"
    redirect_to admin_order_path(@order)
  end

  private
    def order_params
        params.require(:order).permit(:order_status)
    end
end
