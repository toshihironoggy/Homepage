class HomeController < ApplicationController
  PER=5
  
  def index
    if params[:search_tag]
      @movies = Movie.where("tag_name LIKE ?","%#{params[:search_tag]}%").page(params[:page]).per(PER)
    else 
      @movies = Movie.all.page(params[:page]).per(PER)
    end
    
    if params[:search_slide_tag]
      @slides = Slide.where("tag_name LIKE ?","%#{params[:search_slide_tag]}%").page(params[:page]).per(PER)
    else 
      @slides = Slide.all.page(params[:page]).per(PER)
    end
    
  end

  def show
    @movie =Movie.find(params[:id])
    
    @slide = Slide.find(params[:id])
    slide_img_arr =  @slide.image.split(",")
    @slide_img_first = slide_img_arr.first
    @slide_img_arr   = slide_img_arr
    
    
  end
  
end
