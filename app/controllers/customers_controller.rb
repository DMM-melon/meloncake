class CustomersController < ApplicationController
  def show
    @customer = Customer.find(params[:id])
  end

  def edit
  end

  def bye
  end

  def update
  end

  def update_dl
  end
end
