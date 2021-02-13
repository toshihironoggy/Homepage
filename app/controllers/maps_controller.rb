class MapsController < ApplicationController
  def index
    @schools =School.all
    gon.school =@schools.first
    
  end
end
