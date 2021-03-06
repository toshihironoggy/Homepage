# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  before_action :authenticate_user!, except: [:profile]
  before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  # def create
  #   super
  # end

  # GET /resource/edit
  def edit
  end

  # PUT /resource
  def update
    self.resource = resource_class.to_adapter.get!(send(:"current_#{resource_name}").to_key)
    prev_unconfirmed_email = resource.unconfirmed_email if resource.respond_to?(:unconfirmed_email)
 
    #if update_resource(resource, account_update_params)
    if resource.update_without_current_password(account_update_params)
      yield resource if block_given?
      if is_flashing_format?
        flash_key = update_needs_confirmation?(resource, prev_unconfirmed_email) ?
          :update_needs_confirmation : :updated
        set_flash_message :notice, flash_key
      end
      sign_in resource_name, resource, :bypass => true
      #respond_with resource, :location => after_update_path_for(resource)
      
      #アカウント編集後、users#showにリダイレクト
      redirect_to resource
    else
      clean_up_passwords resource
      respond_with resource
    end
  end

  def profile
    @user = User.find(params[:id])
    #@user = User.friendly.find(params[:id])
  end
  
  def update_avatar
    user = current_user
    #p params[:avatar]
    user.avatar = params[:avatar]
    if user.save(context: :validates_profile)
      render json: {user: {avatar: user.avatar.to_s}}, status: :ok
    else
      render json: {errors: user.errors.full_messages.join('\n')}, status: :unprocessable_entity
    end
  end


  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  protected
  
  
  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # 許可するparamsがあれば、追加
  def configure_account_update_params
     devise_parameter_sanitizer.permit(:account_update, keys: [
       :username, :email, :attribute, 
       :password, :avatar, :remove_avatar
      ])
  end
  
  

  #アカウント登録後のリダイレクト先
  # def after_sign_up_path_for(resource)
  #   new_user_session_path(resource)
  # end


  # パスワードを入力しなくても、アカウントを編集できるようにする
  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
  def update_resource(resource, params)
    resource.update_without_current_password(params)
  end
  
  private
    
end
