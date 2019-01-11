class User < ApplicationRecord
  extend Devise::Models
  # Include default devise modules. Others available are:
  # :registerable,:recoverable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
          :rememberable, :registerable, :trackable, :validatable

  has_many :communities
  has_many :projects
  has_many :posts
  has_many :employers
  has_many :ideas
  has_many :places
  has_many :topics
  belongs_to :city

  validates :first_name, presence: true, length: {minimum: 1, maximum: 35}
  validates :last_name, presence: true, length: {minimum: 1, maximum: 35}
  # validates :avatar, presence: true
  # validates :background, presence: true
  # validates :username, presence: true, length: {minimum: 1, maximum: 35}
  # validates :about, length: {minimum: 1, maximum: 100}

  # validates_format_of :username, :with => /\A[a-z]+\z/i
  # validates :username, :uniqueness => {:case_sensitive => false}

  mount_uploader :avatar, AvatarUploader
  mount_uploader :background, ImageUploader

  def name
    "#{first_name} #{last_name}"
  end

end
