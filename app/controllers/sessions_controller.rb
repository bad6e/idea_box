class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(username: params[:login_credentials][:username])
    if @user && @user.authenticate(params[:login_credentials][:password])
      session[:user_id] = @user.id
      redirect_to profile_path
    else
      flash.now[:errors] = "Invalid Login"
      render :new
    end
  end

  def delete
    session.clear
    redirect_to login_path
  end
end
