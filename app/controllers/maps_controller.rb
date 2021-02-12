class MapsController < ApplicationController
  def index
    @schools =School.all
    @schools_json = @schools
    
  end
end
