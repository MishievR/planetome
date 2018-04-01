class Field < ApplicationRecord

  mount_uploader :background, ImageUploader

  has_many :community_fields
  has_many :communities, through: :community_fields

  has_many :project_fields
  has_many :projects, through: :project_fields

  validates :name, :uniqueness => {:case_sensitive => false}
  validates :name, presence: true, length: {minimum: 1, maximum: 25}
  validates :background, presence: true
end
