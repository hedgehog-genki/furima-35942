class ItemsController < ApplicationController
  def new
    @item = Item.new
  end

  def index
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :info, :category_id, :status_id, :fee_status_id, :prefecture_id, :schedule_delivery_id, :price, :images).merge(user_id: current_user.id)
  end
end
