class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  def require_user
    redirect_to '/' unless current_user
  end


   # Перевірка чи цей order належить юзеру, щоб юзер не міг відкрити чужий order по id
  def user_order?(user)
    user == current_user or current_user.role == 'admin'   # Перевірка на адміна
  end
  helper_method :user_order?
end