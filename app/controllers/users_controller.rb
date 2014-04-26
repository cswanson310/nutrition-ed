class UsersController < ApplicationController

  before_filter :set_user, only: [:show]

  skip_filter :authorize, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Successfully registered!"
      redirect_to user_path(@user)
    else
      render action: 'new'
    end
  end

  def show
  end

  protected

  def user_params
    params.require(:user).permit(:username, :new_password,
                                 :new_password_confirmation)
  end

  def set_user
    #it seems sometimes the friendly id is used as an id?
    @user = User.find_by_id(params[:id]) || User.find_by_username(params[:id])
  end
end
