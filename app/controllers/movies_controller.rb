class MoviesController < ApplicationController
  def index
    if params[:search_tag]
      @movies = Movie.where("tag_name LIKE ?","%#{params[:search_tag]}%")
      
    else 
      @movies = Movie.all
    end
  end
  
  def show
    @movie =Movie.find(params[:id])
  end
  
end
