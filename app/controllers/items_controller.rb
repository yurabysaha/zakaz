class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

 def my_order
   @items = Item.where(status: params[:status])
 end

  def show
    @item = Item.find(params[:id])
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
  end

  def destroy
  end

  private
  def item_params
    params.require(:item).permit(:url, :name, :price, :color, :size, :quantity, :u_comment )
  end
end
