class Admin::StatusesController < ApplicationController
  
  def index
    @status = Status.new
    @statuses = Status.all
  end

  def create
    @status = Status.new(status_params)
    if @status.save
      redirect_to admin_statuses_path
    else
      render admin_statuses_path
    end
  end

  def edit
    @status = Status.find(params[:id])
  end

  def update
    @status = Status.find(params[:id])
    @status.update(status_params)
    redirect_to admin_stautses_path
  end
  
  def status_params
    params.require(:status).permit(:name)
  end
  
end