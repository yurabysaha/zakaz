class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to '/'
    else
      redirect_to '/signup'
    end
  end

  def destroy
    @user = User.find_by_id(current_user)
    @user.destroy
    if @user.destroy
      session[:user_id] = nil
      redirect_to '/'
    end
  end

  private
  def user_params
    params.require(:user).permit(:mail, :password, :password_confirmation)
  end
end