class FavoritesController < ApplicationController

  def create
    @photo = Photo.find(params[:favorite][:photo_id])
    @favorites = @photo.favorites
    @favorite = Favorite.new(favorite_params)
    if @favorite.save
      redirect_to photo_path(@photo.id), notice: "Favorited!"
    else
      flash.alert = "Favorite unsuccessful."
      render 'index'
    end
  end

  private
  def favorite_params
    params.require(:favorite).permit(:user_id, :photo_id)
  end

end
