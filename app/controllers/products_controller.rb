class ProductsController < ApplicationController
  def index
  	@genres = Genre.where(genre_status: '0')
    @tax = 1.08

    @genre = Genre.find_by(id: params[:genre_id], genre_status: '0')
    if @genre
      @title = @genre.variety
      @products = Product.where(genre_id: params[:genre_id], product_status: '0')
    else
      redirect_to root_path
    end

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

