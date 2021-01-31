class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :lockable, :timeoutable
         
  validates :username, uniqueness: { case_sensitive: :false }, length: { minimum: 1, maximum: 50 }
  validates :email ,uniqueness: { case_sensitive: :false} ,  length: { maximum: 50 }
  
end
