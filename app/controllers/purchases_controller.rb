class PurchasesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_purchase
  before_action :move_to_index

  def index
    @purchase_shipping = PurchaseShipping.new
  end

  def create
    @purchase_shipping = PurchaseShipping.new(purchase_params)
    if @purchase_shipping.valid?
      pay_item
      @purchase_shipping.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_params
    params.require(:purchase_shipping).permit(:postal_coad, :prefecture_id, :city, :address, :building, :phone_number).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: purchase_params[:token],
      currency: "jpy",
    )
  end

  def set_purchase
    @item = Item.find(params[:item_id])
  end

  def move_to_index
    redirect_to root_path if @item.purchase.present? || current_user.id == @item.user_id
  end
end
