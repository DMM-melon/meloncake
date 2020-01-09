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
      @product = Product.find(params[:id])
  end

  def edit
      @product = Product.find(params[:id])
  end

  def update
      @product = Product.find(params[:id])
      @product.update(product_params)
      redirect_to admin_products_path
  end

# とりあえず削除つけた後からいらない
  def destroy
      @product = Product.find(params[:id])
      @product.destroy
      redirect_to admin_products_path
  end

  private
  def product_params
      params.require(:product).permit(:name, :introduction, :price, :image)
  end
end
