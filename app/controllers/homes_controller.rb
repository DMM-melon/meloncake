class HomesController < ApplicationController
  def top
  	@genres = Genre.where(genre_status: '0')
  	@products = Product.all
  end

  def about
  end
end
