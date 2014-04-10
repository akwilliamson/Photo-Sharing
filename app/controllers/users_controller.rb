class UsersController < ApplicationController
  def index
    @users = User.all
    @photos = Photo.all
  end

  def show
    @user = User.find(params[:id])
    @photo = Photo.new
  end

  def new
    @user = User.new
  end

  def update
    @user = User.find(session[:user_id])
    if params[:user]
      @user.update(users_params)
    end
      redirect_to user_path
  end

  def create
    @user = User.new(users_params)
    if @user.save
      redirect_to root_url, notice: "Thank you for signing up!"
      session[:user_id] = @user.id
    else
      render "new"
    end
  end

  private

  def users_params
    params.require(:user).permit(:avatar, :name, :email, :password, :password_confirmation)
  end

end
