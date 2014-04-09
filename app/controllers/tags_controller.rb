class TagsController < ApplicationController

  def create
    @tag = Tag.new(tag_params)
    if @tag.save
      redirect_to root_url, notice: "Tag successful!"
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
