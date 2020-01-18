class Admin::GenresController < ApplicationController
  before_action :authenticate_admin!
  def index
  	@genre = Genre.new
  	@genres = Genre.all
  end

  def create
  	@genres = Genre.all
  	@genre = Genre.new(genre_params)
  	if @genre.save
      redirect_to admin_genres_path
    else
      flash[:alert] = "ジャンル名を入力してください！"
      render :index
    end
  end

  def edit
  	@genre = Genre.find(params[:id])
  end

  def update
  	@genre = Genre.find(params[:id])
  	@genre.update(genre_params)
    flash[:notice] = "● 状態変更しました"
  	redirect_to admin_genres_path
  end


private
    def genre_params
        params.require(:genre).permit(:variety, :genre_status)
    end

end
