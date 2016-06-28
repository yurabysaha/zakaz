class OrderController < ApplicationController

  def make_order
    @order = current_order
    @order.status = 'new'
    @order.save
    session[:order_id] = nil
    redirect_to action: 'my_order'
  end

  def my_order
      @orders = current_user.orders.where(status: 'new')
      @orders = current_user.orders.where(status: params[:status]) if params[:status]
  end

  def show
    @order = Order.find(params[:id])
    unless user_order?(@order.user_id)
      redirect_to root_path
      flash[:danger] = 'Ви можете дивитись тільки свої замовлення'
    end
  end
end
