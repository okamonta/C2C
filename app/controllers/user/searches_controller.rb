class User::SearchesController < ApplicationController
  
  def search
    @model = params[:model]
    @genre_id = params[:genre_id]
    if @model == 'user'
      @users = User.where("users.account ==  1")
      # @users = User.all
    else
      @videos = Video.search_for(@genre_id)
    end
  end
  
end
