class Admin::OrderItemsController < ApplicationController
  def update
  	@order_item = OrderItem.find(params[:id])
    @order_item.update(order_item_params)

    if @order_item.order_item_status == "製作中"
          @order_item.order.order_status = "製作中"
          @order_item.order.save
    end

    @order_items = @order_item.order.order_items
    if @order_items.all?{|item| item.order_item_status == "製作完了" } #all?で全部該当かチェック
      @order_item.order.order_status = "発送準備中"
      @order_item.order.save
    end

    flash[:notice] = "● 製作ステータス更新しました"
    redirect_to admin_order_path(@order_item.order)
  end

    private
    def order_item_params
        params.require(:order_item).permit(:order_item_status)
    end

end
