class MapsController < ApplicationController
  def index
    @schools =School.all
    @school =@schools.first
    
  end
end
