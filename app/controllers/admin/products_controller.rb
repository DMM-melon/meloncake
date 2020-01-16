class Admin::ProductsController < ApplicationController
  def index
      @product = Product.new
      @products = Product.all
      @products = Product.page(params[:page]).per(3)
      @genres = Genre.all
      @tax = 1.08
  end

  def new
      @product = Product.new
  end

  def create
      @product = Product.new(product_params)
      @product.product_status = Product.product_statuses[product_params[:product_status]]
      @product.genre_id =  Genre.find_by(variety: product_params[:genre_id]).id
      if @product.save
         redirect_to admin_products_path
      else
         flash[:notice] = "すべて埋めてね!!"
         redirect_to new_admin_product_path
      end
  end

  def show
      @product = Product.find(params[:id])
      @tax = 1.08
  end

  def edit
      @product = Product.find(params[:id])
  end

  def update
      @product = Product.find(params[:id])
      @product.update(update_params)
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
      params.require(:product).permit(:name, :introduction, :genre_id, :price, :image, :product_status, :variety)
  end



  def update_params
    {}.tap do |p|
      p["name"] = params[:product][:name]
      p["introduction"] = params[:product][:introduction]
      p["genre_id"] = Genre.find_by(variety: params[:product][:genre_id]).id
      p["product_status"] = params[:product][:product_status]
      p["price"] = params[:product][:price]
      p["image"] = params[:product][:image]
    end
  end
end

