class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show ]
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
      render :new
    end
  end

  def show 
    @item = Item.find(params[:id])
    
  end

  def edit
    @item = Item.find(params[:id])
    unless @item.user_id == current_user.id
      redirect_to action: :index
    end
  end

  def update
    @item = Item.find(params[:id])
      if @item.update(item_params)
        redirect_to root_path
      else
        render :edit
      end
  end

  def destroy
  end


  private

  def item_params
    params.require(:item).permit(:image, :name, :info, :category_id, :sales_id, :price, :shipping_id, :prefecture_id,
                                 :scheduled_id).merge(user_id: current_user.id)
  end
end
