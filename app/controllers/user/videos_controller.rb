class User::VideosController < ApplicationController
  
  def new
    @video = Video.new
  end
  
  def create
    @video = Video.new(video_params)
    @video.user_id = current_user.id
    @video.save
    # showに遷移
    redirect_to user_video_path(@video.id)
  end

  def show
    @video = Video.find(params[:id])
    @user = @video.user
    @comment = Comment.new
  end
  
  def index
    # @user = User.find(current_user.id)
    # @videos = Video.all
    if current_user.account = "challenger"
      @videos = Video.where(user_id: current_user.id)
    else
      @videos = Video.all
    end
  end

  private

  def video_params
    params.require(:video).permit(:title, :content, :genre_id, :video)
  end
  
end