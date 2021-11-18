class Admin::VideosController < ApplicationController
  
  def show
    @video = Video.find(params[:id])
  end
  
  def index
    @videos = Video.all
  end
  
  def destroy
    @video = Video.find(params[:id])
    @video.destroy
    redirect_to admin_videos_path
  end
  
end
