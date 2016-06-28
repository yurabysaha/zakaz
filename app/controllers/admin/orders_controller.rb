class Admin::OrdersController < Admin::ApplicationController

  def index
   @orders = Order.where(status: 'new') if params[:status].nil?
  end

  def dashboard

  end

  def show_orders
    @orders = Order.where(status: params[:status]) if params[:status]
    @orders = Order.where(id: params[:id]) if params[:id]        # Для пошуку по ID в навбарі
    render 'admin/orders/index'
  end

  def show
      @order = Order.find(params[:id])
  end

  def edit
    @item = OrderItem.find(params[:id])
  end

  def update
    @order = OrderItem.find(params[:id]).order
    @order_item = @order.order_items.find(params[:id])
    @order_item.update_attributes(item_params)
    @order.save
    @order_items = @order.order_items
    redirect_to admin_order_path(@order)
  end

  def destroy
    @order = OrderItem.find(params[:id]).order
    @order_item = @order.order_items.find(params[:id])
    @order_item.destroy
    @order.save
    @order_items = @order.order_items
    redirect_to :back
  end


  def update_status
    @order = Order.find(params[:id])
    @order.status=params[:status]
    @order.save
    redirect_to :back
  end
  private

  def item_params
    params.require(:item).permit(:url, :name, :unit_price, :color, :size, :quantity, :u_comment, :total_price, :user_id, :order_id)
  end

end