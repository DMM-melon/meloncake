class HomesController < ApplicationController
  def top
    @genres = Genre.where(genre_status: '0')
    @products = Product.joins(:genre).where("product_status = ? and genres.genre_status = ?", 0, 0).page(params[:page]).per(9)
    @tax = 1.08
  end


  def search
    @genres = Genre.where(genre_status: '0')
    @tax = 1.08
    #Viewのformで取得したパラメータをモデルに渡す
    @products = Product.search(params[:search]).joins(:genre).where("product_status = ? and genres.genre_status = ?", 0, 0).page(params[:page]).per(9)
    render action: :top
  end

  def about
  end
end
