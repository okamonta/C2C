class User::CommentsController < ApplicationController
  
  def index
    @video = Video.find(params[:video_id])
    @comments = Comment.all
    @comment = Comment.new
  end
    
  def create
    @video = Video.find(params[:video_id])
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    @comment.video_id = @video.id
    if @comment.save
      redirect_to user_video_comments_path(@video.id)
    else
      @user = @video.user
      render 'videos/show'
    end
  end
  
  def destroy
    @video = Video.find(params[:video_id])
    @comment = @video.comments.find(params[:id])
    @comment.destroy
  end
  
  private
  
  def comment_params
    params.require(:comment).permit(:comment)
  end
  
end
