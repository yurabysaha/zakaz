class Admin::OrdersController < Admin::ApplicationController

  def index

   @orders = Order.where(status: 'new') if params[:status].nil?

  end

  def show_orders
    @orders = Order.where(status: params[:status]) if params[:status]
    @orders = Order.where(id: params[:id]) if params[:id]        # Для пошуку в
    render 'admin/orders/index'
  end

  def show
      @order = Order.find(params[:id])
  end

  def update

  end

end