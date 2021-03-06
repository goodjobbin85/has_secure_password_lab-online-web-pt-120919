class SessionsController < ApplicationController
  def new

  end

  def create
    @user = User.find_by(name: params[:name])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to :welcome
    else
      render :new
    end
  end

  def destroy
    session.delete :user_id 
    redirect_to :login
  end
end
