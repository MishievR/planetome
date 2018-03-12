class Community < ApplicationRecord
  mount_uploader :background, ImageUploader

  belongs_to :user
  has_many :community_fields
  has_many :fields, through: :community_fields

  validates :name, :uniqueness => {:case_sensitive => false}
  validates :name, presence: true, length: {minimum: 1, maximum: 45}
  validates :description, presence: true, length: {minimum: 1, maximum: 300}
  validates :background, presence: true

end
