class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show, :edit]
  def new
  end
  
  def show
    @user = User.new
    @user = User.find(params[:id])
    @items = @user.items
  end

  def edit
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end
    private
    def user_params
      params.require(:user).permit(:nickname, :email, :password, :password_confirmation)
    end
end
