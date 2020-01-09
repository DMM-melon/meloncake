class ProductsController < ApplicationController
  def index
  	@genres = Genre.all
  end

  def show
  end
end
