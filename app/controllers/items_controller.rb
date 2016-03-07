class ItemsController < ApplicationController
  def index
  end

  def new
  end

  def edit
  end

  def create
    @item = Item.new(item_params)
    @item.user_id = current_user.id
    if @item.save
      redirect_to '/'
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
