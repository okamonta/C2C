class User::VideosController < ApplicationController
  
  def new
    @video = Video.new
  end
  
  def create
    @video = Video.new(video_params)
    @video.create
    # 動画一覧に遷移に後ほど変更（今は動画）
    redirect_to @video
  end

  def show
    @video = Video.find(params[:id])
  end

  private

  def video_params
    params.require(:video).permit(:title, :content, :genre_id, :video)
  end
  
end
