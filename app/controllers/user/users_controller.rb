class User::UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
  end
  
  def index
  end
  
  def edit
  end
  
  def update
  end


  private
  
  def user_params
    params.require(:user).permit(:full_name, :nick_name, :icon, :genre_id, :status_id, :account, :email)
  end
  
end
