class Community < ApplicationRecord
  mount_uploader :background, ImageUploader

  validates :name, :uniqueness => {:case_sensitive => false}
  validates :name, presence: true, length: {minimum: 1, maximum: 45}
  validates :description, presence: true, length: {minimum: 1, maximum: 300}
end
