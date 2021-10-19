class MogisuppleController < ApplicationController
  PER =5 
  
  def index
    if params[:search_tag]
      @movies = Movie.where("tag_name LIKE ?","%#{params[:search_tag]}%")
    else 
      @movies = Movie.all
    end
  end

  def show
    @movie =Movie.find(params[:id])
    
    #もしユーザーがログインしていたら
    if user_signed_in? 
      @watched = Watched.new(user_id: current_user.id, movie_id: @movie.id)
      @watched.save
    end
  end
end
