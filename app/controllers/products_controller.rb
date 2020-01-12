class ProductsController < ApplicationController
  def index
  	@genres = Genre.where(genre_status: '0')
    @title = Genre.find_by(id: params[:genre_id]).variety
    @products = Product.where(genre_id: params[:genre_id])
    @tax = 1.08
    # if文で構成したほうがいいとのこと
  	# genre_idがないproduct/のときは@products = Product.all
  end

  def show
  	@genres = Genre.where(genre_status: '0')
  	@product = Product.find(params[:id])
    @tax = 1.08
  	#@cart_item = Cart_item.new
  end

  def create
  end
end

