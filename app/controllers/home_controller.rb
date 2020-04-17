class HomeController < ApplicationController
  PER=5
  
  def index
    if params[:search_tag]
      @movies = Movie.where("tag_name LIKE ?","%#{params[:search_tag]}%").page(params[:page]).per(PER)
    else 
      @movies = Movie.all.page(params[:page]).per(PER)
    end
  end

  def show
    @movie =Movie.find(params[:id])
  end
  
end
