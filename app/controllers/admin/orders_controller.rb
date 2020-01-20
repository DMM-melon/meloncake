class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!
  def index

    if params[:button].to_i == 1 # ヘッダーから
      @orders = Order.all.order(created_at: :desc).page(params[:page]).per(10)
    elsif params[:button].to_i == 2 #会員詳細から
      @customer = Customer.with_deleted.find(params[:id])
      @orders = @customer.orders.all.order(created_at: :desc).page(params[:page]).per(10)
    else #トップページから
      @orders = Order.where("created_at >= ?", Time.zone.now.beginning_of_day).order(created_at: :desc).page(params[:page]).per(10)
    end
  end

  def show
    @order = Order.find(params[:id])
    @order_items = @order.order_items.all
    @carriage = 800
    @name = @order.customer.last_name + " " + @order.customer.first_name
  end

  def update
    @order = Order.find(params[:id])
    @order_items = @order.order_items.all
    @order.update(order_params)

    if @order.order_status == "入金確認"
        @order_items.each do |item|
          item.order_item_status = "製作待ち"
          item.save
        end
    end
    flash[:notice] = "● 注文ステータス更新しました"
    redirect_to admin_order_path(@order)
  end

  private
    def order_params
        params.require(:order).permit(:order_status)
    end
end


