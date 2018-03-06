class City < ApplicationRecord
  mount_uploader :background, ImageUploader

  validates :name, :uniqueness => {:case_sensitive => false}
  validates :name, presence: true, length: {minimum: 1, maximum: 25}
  validates :country, presence: true, length: {minimum: 2, maximum: 45}
end
