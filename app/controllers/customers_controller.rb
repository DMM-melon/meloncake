class CustomersController < ApplicationController
  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def bye
    @customer = Customer.find(params[:id])
  end

  def changepass
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    @customer.update(customer_params)
    redirect_to customer_path(current_customer)
  end

  def update_dl
    @customer = Customer.find(params[:id])
    @customer.destroy
    redirect_to root_path
  end

 private
  def customer_params
     params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postcode, :address, :phone)
  end

end
