class TestkaiEndLoginController < ApplicationController
  def login_form
    @employees = Employee.all
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
        redirect_to("/testkai_end/new")  
      else
        flash[:notice] ="miss login"
        render("testkai_end_login/login_form")
      end 
    else
      flash[:notice] ="miss login"
      render("testkai_end_login/login_form")
    end
  end

  def logout
    session[:employee_id] = nil
    flash[:notice] ="success logout"
    redirect_to("testkai_end_login/login_form")
  end
end
