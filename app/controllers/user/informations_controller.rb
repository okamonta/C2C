class User::InformationsController < ApplicationController
  
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
  end
  
  def update
  end
  
  def destroy
  end
  
  private
  
  def information_params
    params.require(:information).permit(:title, :content)
  end


end
