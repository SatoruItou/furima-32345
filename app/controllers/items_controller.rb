class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  def index
    @items = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render new_item_path
    end
  end

  def show 
    @item = Item.find(params[:id])
    @user = User.find(@item.user_id)
  end

  def edit
  end

  def destroy
    
  end


  private

  def item_params
    params.require(:item).permit(:image, :name, :info, :category_id, :sales_id, :price, :shipping_id, :prefecture_id,
                                 :scheduled_id).merge(user_id: current_user.id)
  end
end
