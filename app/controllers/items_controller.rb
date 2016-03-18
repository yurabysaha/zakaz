class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

 def my_order
   if current_user.role == 'admin'
     @items = Item.where(status: params[:status])
   else
     @items = current_user.items.where(status: params[:status])
   end
 end

  def show
    @item = Item.find(params[:id])
    unless user_order?(@item.user)
      redirect_to root_path
      flash[:danger] = 'Ви можете дивитись тільки свої замовлення'
    end
  end

  def new
  end

  def edit
  end

  def create
    @item = Item.new(item_params)
    @item.user_id = current_user.id
    if @item.save
      redirect_to '/my_order?status=new'
    else
      render 'new'
    end
  end

  def update
    @item  = Item.find(params[:id])

    if @item.update_attributes(item_params)
      redirect_to :back
    else
      redirect_to :back
    end
  end

  def destroy
  end

  private
  def item_params
    params.require(:item).permit(:url, :name, :price, :color, :size, :quantity, :u_comment, :a_comment, :total_price, :status, :delivery_price )
  end
end
