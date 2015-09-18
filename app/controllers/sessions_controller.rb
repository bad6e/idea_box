class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(username: params[:login_credentials][:username])
    if @user && @user.authenticate(params[:login_credentials][:password])
      session[:user_id] = @user.id
      route_user(@user)
    else
      flash.now[:errors] = "Invalid Login"
      render :new
    end
  end

  def delete
    session.clear
    redirect_to login_path
  end

  def route_user(user)
    if @user.role == 'admin'
      redirect_to admin_categories_path
    else
      redirect_to profile_path
    end
  end
end
