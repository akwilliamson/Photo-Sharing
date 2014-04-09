class UsersController < ApplicationController
  def index
    @users = User.all
    @photo = Photo.new
    @photos = Photo.all
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(users_params)
    if @user.save
      redirect_to root_url, notice: "Thank you for signing up!"
    else
      render "new"
    end
  end

  private

  def users_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

end
