class MapsController < ApplicationController
  def index
    @schools =School.all
    gon.schools = School.all
  end
  
  def update
	  @school= School.find(params[:school_id])
	  @school.max_num_seats = [@school.max_num_seats, (params[:number].to_i)*(-1)].sum
	  @school.save
	  redirect_to root_path
  end
  
end