class PhotosController < ApplicationController

  before_filter :authorize, only: [:create, :show]

  def show
    @photo = Photo.find(params[:id])
    @tags = @photo.tags
    @tag = Tag.new
  end

  def create
    @photo = Photo.create(photo_params)
    if @photo.save
      redirect_to root_url, notice: "Photo Posted!"
    else
      redirect_to root_url
    end
  end

  private
  def photo_params
    params.require(:photo).permit(:post)
  end

end
