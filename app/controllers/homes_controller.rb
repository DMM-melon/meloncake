class HomesController < ApplicationController
  def top
  	@genres = Genre.where(genre_status: '0')
  	@products = Product.joins(:genre).where("product_status = ? and genres.genre_status = ?", 0, 0).page(params[:page]).per(3)
  	@tax = 1.08
  end

  def about
  end
end
