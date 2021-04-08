class PurchasesController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  def index
    @item = Item.find(params[:item_id])
  end

  def new
    
    @purchase_address = PurchaseAddress.new(address_params)
  end

  def create
    @item = Item.find(params[:item_id])
    @purchase_address = PurchaseAddress.new(address_params)
    if @purchase_address.valid?
      @purchase_address.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private
  def address_params
    params.require(:purchase_address).permit(:postal_code, :prefecture_id, :city, :address, :building, :phone_number )
  end
end
