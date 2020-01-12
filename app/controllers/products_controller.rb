class ProductsController < ApplicationController
  def index
  	@genres = Genre.where(genre_status: '0')
  	@count = Product.where(genre_id: params[:genre_id]).count
  	@products = Product.where(genre_id: params[:genre_id])
  	# if文で構成したほうがいいとのこと
  	# genre_idがないproduct/のときは@products = Product.all
  end

  def show
  	@genres = Genre.where(genre_status: '0')
  	@product = Product.find(params[:id])
  	#@cart_item = Cart_item.new
  end

  def create

  end
end

