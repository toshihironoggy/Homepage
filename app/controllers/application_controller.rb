class ApplicationController < ActionController::Base
  #Devise用
  protect_from_forgery with: :exception
  
  # 全てのアクションの前に、ユーザーがログインしているかどうか確認、authenticate:認証
  # コメントアウトするとサンプルページに飛ばない
  #before_action :authenticate_user!
  
  # deviseコントローラーにストロングパラメータを追加する 
  before_action :configure_permitted_parameters, if: :devise_controller?

  #-------------------------
  private
  
    #showページはログインしているユーザーだけにアクセスさせ、ログインしてない場合はログインページに遷移
    def sign_in_required
      redirect_to new_user_session_url unless user_signed_in?
    end
  
  #----------------------------  
  protected
  
    #configure:設定 
    def configure_permitted_parameters
      # サインアップ時にusernameのストロングパラメータを追加
      devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
      
      # アカウント編集の時にusernameとprofileのストロングパラメータを追加
      devise_parameter_sanitizer.permit(:account_update, keys: [:username])
    end
  
    
end
