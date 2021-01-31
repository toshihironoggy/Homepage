class ApplicationController < ActionController::Base
  before_action :set_current_employees
  
  #Devise用
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?


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

  #-------------------------
  private
  
    def sign_in_required
      redirect_to new_user_session_url unless user_signed_in?
    end
    
  #----------------------------  
  protected
    #Devise用　登録formから入力したusernameを保存できるように
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
    end
    
end
