class MapsController < ApplicationController
  def index
    @schools =School.all
    gon.schools = School.all
    
  end
end