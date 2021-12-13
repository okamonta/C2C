class Admin::InformationsController < ApplicationController
  before_action :authenticate_admin!
  
  def show
    @information = Information.find(params[:id])
  end
  
  def index
    @informations = Information.all
  end
  
  def destroy
    @information = Information.find(params[:id])
    @information.destroy
    redirect_to admin_informations_path
  end

end
