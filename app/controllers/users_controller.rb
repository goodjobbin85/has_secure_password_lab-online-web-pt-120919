class UsersController < ApplicationController
  def index
    @users = User.all
  end
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.valid?
      @user.save
      session[:user_id] = @user.id
      redirect_to :welcome
    else
      render :new
    end
  end

  def welcome
    @user = User.find(params[:id]) if @user
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
