
class Community < ApplicationRecord
  mount_uploader :background, ImageUploader

  belongs_to :user
  has_many :community_fields
  has_many :fields, through: :community_fields
  has_many :posts
  has_many :community_categories
  has_many :categories, through: :community_categories
  has_many :community_jobs
  has_many :jobs, through: :community_jobs

  validates :name, :uniqueness => {:case_sensitive => false}
  validates :name, presence: true, length: {minimum: 1, maximum: 45}
  validates :description, presence: true, length: {minimum: 50, maximum: 160}
  validates :background, presence: true

end
