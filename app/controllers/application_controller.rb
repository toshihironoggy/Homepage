class ApplicationController < ActionController::Base
  before_action :set_current_employees
    
  def set_current_employees
    @current_employee = Employee.find_by(id: session[:employee_id]) 
  end

  def authenticate_employees
    if @current_employee == nil
      redirect_to("/")
    end
  end

  def after_sign_in_path_for(resource)
    pages_show_path
  end

  private
    def sign_in_required
      redirect_to new_user_session_url unless user_signed_in?
    end
    
end
