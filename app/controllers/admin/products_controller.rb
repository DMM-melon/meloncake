class Admin::ProductsController < ApplicationController
  def index
  end

  def new
      @product = Product.new
      # @product = Product.all
  end

  def create
  end

  def show
  end

  def edit
  end

  def update
  end
  private
  def product_params
      params.require(:product).permit(:name, :introduction, :price)
  end

  private
  def product_params
      params.require(:product).permit(:name, :introduction, :price)
  end
end