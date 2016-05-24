class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
  end

  def new
  end

  def edit
    @user = User.find(params[:id])
  end


  def update
    @user = User.find(params[:id])

    if @user.update_attributes(user_params)
      redirect_to '/'
      flash.now[:success] = "Профіль успішно оновлено"
    else
      render 'edit'
    end
  end

  def destroy
=begin
    @user = User.find_by_id(params[:id])
    @user.destroy
    if @user.destroy
      session[:user_id] = nil
      redirect_to '/'
    end
=end
  end

  private
  def user_params
    params.require(:user).permit(:email, :phone, :address)
  end
end