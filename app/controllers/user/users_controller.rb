class User::UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def index
    @users = User.where("users.account ==  1")
    @user = current_user
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_user_path(@user)
  end


  private

  def user_params
    params.require(:user).permit(:full_name, :nick_name, :icon, :genre_id, :status_id, :account, :email, :message, :user)
  end

end
