class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?

   # Перевірка чи цей order_items належить юзеру, щоб юзер не міг відкрити чужий order_items по id
  def user_order?(user)
    user == current_user.id
  end
  helper_method :user_order?

  protected

  def configure_permitted_parameters
    # Fields for sign up
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email, :password, :phone) }
    # Fields for editing an existing account
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:email, :phone, :address, :current_password) }
  end

  helper_method :current_order

  def current_order
    if !session[:order_id].nil?
      Order.find(session[:order_id])
    else
      Order.new(:user_id => current_user.id)
    end
  end
end