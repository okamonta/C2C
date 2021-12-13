class User::InformationsController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:edit, :update, :destroy]
  
  def new
    @information = Information.new
  end
  
  def show
    @information = Information.find(params[:id])
  end
  
  def index
    @informations = Information.all
  end
  
  def create
    @information = Information.new(information_params)
    @information.user_id = current_user.id
    if @information.save
      redirect_to user_informations_path
    else
      @user = User.find(current_user.id)
      @informations = Information.all
      render "index"
    end
  end
  
  def edit
    @information = Information.find(params[:id])
  end
  
  def update
    @information = Information.find(params[:id])
    @information.update(information_params)
    redirect_to user_information_path(@information)
  end
  
  def destroy
  end
  
  private
  
  def information_params
    params.require(:information).permit(:title, :content)
  end
  
  def ensure_correct_user
    @information = Information.find(params[:id])
    unless @information.user == current_user
      redirect_to user_informations_path
    end
  end


end
