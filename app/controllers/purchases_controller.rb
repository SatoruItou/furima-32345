class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_itemId, only: [:index, :create]
  before_action :redirect_user_purchase, only: [:index, :create]
  def index
    @purchase_address = PurchaseAddress.new
  end

  def create
    @purchase_address = PurchaseAddress.new(address_params)
    if @purchase_address.valid?
      pay_item
      @purchase_address.save
      redirect_to root_path
    else
      render 'purchases/index'
    end
  end

  private

  def address_params
    params.require(:purchase_address).permit(:postal_code, :prefecture_id, :city, :address, :building, :phone_number).merge(
      token: params[:token], item_id: params[:item_id], user_id: current_user.id
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item[:price],
      card: address_params[:token],
      currency: 'jpy'
    )
  end

  def set_itemId
    @item = Item.find(params[:item_id])
  end

  def redirect_user_purchase
    redirect_to root_path if current_user == @item.user || @item.purchase != nil
  end
end
