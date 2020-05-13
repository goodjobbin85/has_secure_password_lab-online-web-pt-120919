require 'pry'

class UsersController < ApplicationController
  def index
    @users = User.all
  end
  def new
    @user = User.new
  end

  def create
    #raise params.inspect
    @user = User.create(user_params)
    #binding.pry
    if @user.save
      session[:user_id] = @user.id
      redirect_to :welcome
    else
      render :new
    end
  end

  def welcome
    @user = User.find(session[:user_id]) 
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
