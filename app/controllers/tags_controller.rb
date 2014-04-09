class TagsController < ApplicationController

  def create
    @photo = Photo.find(params[:tag][:photo_id])
    @tags = @photo.tags
    @tag = Tag.new(tag_params)
    if @tag.save
      redirect_to photo_path(@photo.id), notice: "Tag successful!"
    else
      flash.alert = "Tag unsuccessful."
      render 'index'
    end
  end

  private
  def tag_params
    params.require(:tag).permit(:user_id, :photo_id)
  end

end
