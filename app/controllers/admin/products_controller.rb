class Admin::ProductsController < ApplicationController
  def index
      @product = Product.new
      @products = Product.all
  end

  def new
      @product = Product.new
      # @product = Product.all
  end

  def create
      @product = Product.all
      @product = Product.new(product_params)
      @product.save
      redirect_to admin_products_path
  end

  def show
  end

  def edit
      
  end

  def update
      @product = Product.find(params[:id])
  end
  private
  def product_params
      params.require(:product).permit(:name, :introduction, :price)
  end
end
