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
    
    
    @watched_count = Watched.where(user_id: @user.id).count
    
    
    @schedules = @user.schedules
    
  end

end
