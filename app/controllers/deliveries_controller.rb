class DeliveriesController < ApplicationController
  before_action :authenticate_customer!

  def index
    @delivery = Delivery.new
    @deliveries = current_customer.deliveries.all
  end

  def create
    @deliveries = current_customer.deliveries.all
    @delivery = Delivery.new(delivery_params)
    @delivery.customer_id =  current_customer.id
    if @delivery.save
    redirect_to deliveries_path
    else
      @error_msg= ""
       if params[:delivery][:postcode].blank?
          @error_msg = "● 郵便番号を入力してください 　 "

       end 
       if   params[:delivery][:address].blank?
          @error_msg += "● 住所を入力してください 　 "
       end
       if    params[:delivery][:name].blank?
          @error_msg += "● 宛名を入力してください 　 "
       end
       if @error_msg != ""
          render :index
       end
    end
  end

  def destroy
      @delivery = Delivery.find(params[:id])
      @delivery.destroy
      redirect_to deliveries_path
  end

  def edit
    @delivery = Delivery.find(params[:id])
  end

  def update
    @delivery = Delivery.find(params[:id])
    if @delivery.update(delivery_params)
      redirect_to deliveries_path
    else
      @error_msg= ""
       if params[:delivery][:postcode].blank?
          @error_msg = "郵便番号を入力してください"
       end
       if   params[:delivery][:address].blank?
          @error_msg += " 住所を入力してください"
       end
       if    params[:delivery][:name].blank?
          @error_msg += "　宛名を入力してください"
       end
       if @error_msg != ""
          render :edit
       end
    end
  end

  private
    def delivery_params
        params.require(:delivery).permit(:postcode, :address, :name)
    end

end
