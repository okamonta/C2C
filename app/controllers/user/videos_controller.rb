class User::VideosController < ApplicationController
  
  def new
    @video = Video.new
  end
  
  def create
    @video = Video.new(video_params)
    @video.user_id = current_user.id
    @video.save!
    # 動画一覧に遷移に後ほど変更（今は動画）
    redirect_to user_video_path(@video.id)
  end

  def show
    @video = Video.find(params[:id])
    @user = @video.user
    @comment = Comment.new
  end
  
  def index
    @videos = Video.all
  end

  private

  def video_params
    params.require(:video).permit(:title, :content, :genre_id, :video)
  end
  
end