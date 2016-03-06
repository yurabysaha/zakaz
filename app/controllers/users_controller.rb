class UsersController < ApplicationController
  before_action :require_user, only: [:edit, :update, :destroy]
  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
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


  def update
    @user = User.find(params[:id])

    if @user.update_attributes(user_params)
      flash[:success] = "Профіль оновлено"
      redirect_to '/'
    else
      render 'edit'
    end
  end

  def destroy
    @user = User.find_by_id(params[:id])
    @user.destroy
    if @user.destroy
      session[:user_id] = nil
      redirect_to '/'
    end
  end

  private
  def user_params
    params.require(:user).permit(:mail, :password, :password_confirmation, :phone, :address)
  end
end