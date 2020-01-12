class HomesController < ApplicationController
  def top
  	@genres = Genre.where(genre_status: '0')
  	@products = Product.all
  	@tax = 1.08
  end

  def about
  end
end
