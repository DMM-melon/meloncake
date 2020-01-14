class ProductsController < ApplicationController
  def index
  	@genres = Genre.where(genre_status: '0')
    @tax = 1.08
    @title = Genre.find_by(id: params[:genre_id]).variety
    @products = Product.where(genre_id: params[:genre_id], product_status: '0')
    # if文で構成したほうがいいとのこと
  	# genre_idがないproduct/のときは@products = Product.where(product_status: '1')
  end

  def show
  	@genres = Genre.where(genre_status: '0')
  	@product = Product.find(params[:id])
  	@cart_item = CartItem.new
    @tax = 1.08
  end

  def create
  end
end

