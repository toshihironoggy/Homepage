class ApplicationController < ActionController::Base
  
  #Devise用
  protect_from_forgery with: :exception
  # deviseコントローラーにストロングパラメータを追加する 
  before_action :configure_permitted_parameters, if: :devise_controller?

  #ログイン後に遷移したいページへ
  def after_sign_in_path_for(resource)
    user_path(resource.id)
  end

  #-------------------------
  private
  
    #showページはログインしているユーザーだけにアクセスさせ、ログインしてない場合はログインページに遷移
    def sign_in_required
      redirect_to new_user_session_url unless user_signed_in?
    end
    
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :avatar])
    end
    
  #----------------------------  
  protected
    #Devise用　登録formから入力したusernameを保存できるように
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
    end
    
end
