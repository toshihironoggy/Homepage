class UsersController < ApplicationController
  
  before_action :authenticate_user!
  
  def show
    #@user = User.find(params[:id])
    @user = User.find(current_user.id)
    
    if params[:search_tag]
      @movies = Movie.where("tag_name LIKE ?","%#{params[:search_tag]}%")
    else 
      @movies = Movie.all
    end
    
    #fullcalendar
    @events = Event.where(user_id: @user.id)
    @event = Event.new
    
  end


end
