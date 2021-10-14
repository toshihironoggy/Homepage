class UsersController < ApplicationController
  
  def show
    #@user = User.find(params[:id])
    @user = User.find(current_user.id)
    
    if params[:search_tag]
      @movies = Movie.where("tag_name LIKE ?","%#{params[:search_tag]}%")
    else 
      @movies = Movie.all
    end
  end


end
