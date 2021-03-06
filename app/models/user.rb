class User < ApplicationRecord
  
  #mount_uploader :avatar, AvatarUploader
  mount_base64_uploader :avatar, AvatarUploader
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :lockable, :timeoutable
  
  #名前のvalidation、10字以内、allow_blankでusernameは空欄でもok       
  validates :username, uniqueness: { case_sensitive: :false }, length: { minimum: 1, maximum: 10 }, allow_blank: true, on: [:validates_profile]
  validates :email ,uniqueness: { case_sensitive: :false} ,  length: { maximum: 50 }, on: [:validates_profile]
  
  has_many :schedules
  
  #ここから
  def update_without_current_password(params, *options)
    params.delete(:current_password)
    
    if params[:password].blank? && params[:password_confirmation].blank?
      params.delete(:password)
      params.delete(:password_confirmation)
    end

    result = update_attributes(params, *options)
    clean_up_passwords
    result
  end
  
end
