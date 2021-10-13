class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
    
    if params[:search_tag]
      @movies = Movie.where("tag_name LIKE ?","%#{params[:search_tag]}%")
    else 
      @movies = Movie.all
    end
  end


end
