class UserSessionsController < ApplicationController
  skip_before_filter :authorize

  def new
  end

  def create
    user = User.find_by_username(params[:username])
    if user and User.authenticate(params[:username], params[:password])
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      redirect_to new_user_session_path, alert: "Invalid user/password combination"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path, notice: "Successfully logged out"
  end

end
