class User < ApplicationRecord
  extend Devise::Models
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  validates :first_name, presence: true, length: {minimum: 1, maximum: 35}
  validates :last_name, presence: true, length: {minimum: 1, maximum: 35}
  validates :username, presence: true, length: {minimum: 1, maximum: 35}
  validates :about, length: {minimum: 1, maximum: 100}

  validates_format_of :username, :with => /\A[a-z]+\z/i
  validates :username, :uniqueness => {:case_sensitive => false}

  mount_uploader :avatar, AvatarUploader
  mount_uploader :background, ImageUploader
  def name
    "#{first_name} #{last_name}"
  end

end
