class User < ApplicationRecord
  mount_uploader :avatar, AvatarUploader
  
  has_many :publications
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  enum role: {admin: 0, normal: 1, guest: 2} #Roles de CanCanCan

  validates :phone, :numericality => { :only_integer => true }

end
