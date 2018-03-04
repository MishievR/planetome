class User < ApplicationRecord
  extend Devise::Models
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  mount_uploader :avatar, AvatarUploader
  mount_uploader :background, ImageUploader
  def name
    "#{first_name} #{last_name}"
  end

end
