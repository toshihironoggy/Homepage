class SlideController < ApplicationController
  def index
    @slides = Slide.all
  end
  
  def show
    @slide = Slide.find(params[:id])
    
    slide_img_arr =  @slide.image.split(",")
    @slide_img_first = slide_img_arr.first
    @slide_img_arr   = slide_img_arr
  end
end
