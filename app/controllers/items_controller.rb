class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show ]
  before_action :set_item,  only: [:show, :edit, :update, :destroy]
  before_action :unless_item, only: [:edit, :update, :destroy]
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
  end

  def edit
  end

  def update
   
      if @item.update(item_params)
        redirect_to item_path(@item.id)
      else
        render :edit
      end
  end

  def destroy
    @item.delete
    redirect_to root_path
  end


  private

  def item_params
    params.require(:item).permit(:image, :name, :info, :category_id, :sales_id, :price, :shipping_id, :prefecture_id,
                                 :scheduled_id).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def unless_item
    unless @item.user_id == current_user.id
      redirect_to action: :index
    end
  end
end
