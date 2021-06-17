class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:edit, :show, :update, :destroy]
  before_action :move_to_index, only: [:edit, :update, :destroy]
  before_action :soldout, only: [:show]
  before_action :user_soldout, only: [:edit]

  def new
    @item = Item.new
  end

  def index
    @items = Item.all.order("created_at DESC")
  end

  def edit
  end

  def show
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  def update
    @item.update(item_params)
    if @item.save
      redirect_to item_path(@item.id)
    else
      render :edit
    end
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

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name, :info, :category_id, :status_id, :fee_status_id, :prefecture_id, :schedule_delivery_id,
                                 :price, :image).merge(user_id: current_user.id)
  end

  def move_to_index
    if @item.user_id != current_user.id
      redirect_to action: :index
    end
  end

  def soldout
    if @item.user_id != current_user.id && @item.purchase.present?
      redirect_to action: :index
    end
  end

  def user_soldout
    if @item.user_id == current_user.id && @item.purchase.present?
      redirect_to action: :index
    end
  end
end
