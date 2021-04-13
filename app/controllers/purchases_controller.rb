class PurchasesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_itemId, only: [:index, :create]
  def index
  
    @purchase_address = PurchaseAddress.new
    if current_user == @item.user
      redirect_to root_path 
    end
    if @item.purchase != nil
      redirect_to root_path
    end
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

end
