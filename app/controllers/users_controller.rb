class UsersController < ApplicationController

  def new
  end
  
  def show
    @user = User.new
    @user = User.find(params[:id])
    @items = @user.items
  end
end
