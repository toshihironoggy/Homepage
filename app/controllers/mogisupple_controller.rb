class MogisuppleController < ApplicationController
  PER =5 
  
  def index
    if params[:search_tag]
      @movies = Movie.where("tag_name LIKE ?","%#{params[:search_tag]}%")
      if user_signed_in?
        redirect_to  controller: :users, action: :show
      end
    else 
      @movies = Movie.all
    end
    
    
  end

  def show
    @movie =Movie.find(params[:id])
  end
end
