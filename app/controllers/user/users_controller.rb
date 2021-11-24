class User::UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    # if current_user == User.where("@user.account = 'challenger'")
    #   redirect_to user_user_path(user.id)
    # else
    #   redirect_to user_root_path
    # end
  end

  def index
    # @user = User.find(params[:id])
    # @users = User.all
    @users = User.where("users.account ==  1")
    @user = current_user
    # if current_user == @user.account = 'challenger'
    #   @users = User.where("users.account == 1")
    # else
    #   @users = User.all
    # end
  end

  # def whole
  #   @users = User.all
  # end

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

  # def ensure_correct_user
  #   @user = User.find(params[:id])
  #   unless @user == current_user
  #     redirect_to user_path(current_user)
  #   end
  # end

end
