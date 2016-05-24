class OrderItemsController < ApplicationController
  def create
    @order = current_order
    @order_item = @order.order_items.new(item_params)
    @order_item.user_id = current_user.id
    @order.save!
    session[:order_id] = @order.id
    redirect_to cart_path
  end
  def edit
    @item = OrderItem.find(params[:id])
  end
  def update
    @order = current_order
    @order_item = @order.order_items.find(params[:id])
    @order_item.update_attributes(item_params)
    @order.save
    @order_items = @order.order_items
    redirect_to cart_path
  end

  def destroy
    @order = current_order
    @order_item = @order.order_items.find(params[:id])
    @order_item.destroy
    @order.save
    @order_items = @order.order_items
    redirect_to :back
  end


  private

  def item_params
    params.require(:item).permit(:url, :name, :unit_price, :color, :size, :quantity, :u_comment, :total_price, :user_id, :order_id)
  end
end