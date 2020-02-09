class TestkaiController < ApplicationController
  
  before_action :authenticate_employees
  
  def index
    @schools = School.all
  end

  def new
  end

  def create
    employee = Employee.find_by(id: session[:employee_id]) 
    @school = School.find_by(name: employee.name) 

    schoolnameTemp = @school.schoolname
    nameTemp = @school.name
    @school.destroy
    # @member = Member.find_by(schoolname: school.schoolname)
    
    @school = School.new(
      schoolname: schoolnameTemp,
      name: nameTemp,
      chief: params[:chief], 
      security: params[:security], 
      staff: params[:staff], 
      supervision: params[:supervision]
    )
    #@member = Member.new(
    #  schoolname: school.schoolname,
    #  chief: params[:chief], 
    #  security: params[:security], 
    #  staff: params[:staff], 
    #  supervision: params[:supervision]
    #)
    @school.save
    flash[:notice] = "success!"
    redirect_to("/testkai/index")
  end 
  
end
