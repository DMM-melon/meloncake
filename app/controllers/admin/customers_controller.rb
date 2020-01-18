class Admin::CustomersController < ApplicationController
  before_action :authenticate_admin!
  def index
  	@customers = Customer.all.with_deleted
  end

  def show
  	@customer = Customer.with_deleted.find(params[:id])
  end

  def edit
  	@customer = Customer.with_deleted.find(params[:id])
  end

  def update
  	@customer = Customer.with_deleted.find(params[:id])
    if params[:customer][:deleted_at] == "true"
      #復活
      @customer.restore
    else
      #削除
      @customer.destroy
    end
    @customer.update(customer_params)
  	redirect_to admin_customer_path
  end

 private
  def customer_params
  	params.require(:customer).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :postcode, :address, :phone, :email)
  end
end
