class EmployeesController < ApplicationController
  def index
  end
  
  def login_form
  end
  
  def login
    @employee = Employee.find_by(
      name: params[:name],
      password: params[:password]
    )

    if @employee
      @school = School.find_by(name: @employee.name) 
      if @school  
        session[:employee_id] = @employee.id
        
        flash[:notice] ="success login"
        redirect_to("/testkai/new")  
      else
        flash[:notice] ="miss login"
        render("employees/login_form")
      end 
    else
      flash[:notice] ="miss login"
      render("employees/login_form")
    end
  end

  def logout
    session[:employee_id] = nil
    flash[:notice] ="success logout"
    redirect_to("/login")
    
  end
end
