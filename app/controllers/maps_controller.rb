class MapsController < ApplicationController
  def index
    @schools =School.all
    
    
  end
end
