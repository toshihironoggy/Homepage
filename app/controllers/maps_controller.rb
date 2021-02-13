class MapsController < ApplicationController
  def index
    @schools =School.all
    @school = @schools.first
    gon.school =@schools.first
    
  end
end
