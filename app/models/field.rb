class Field < ApplicationRecord

  mount_uploader :background, ImageUploader

  validates :name, :uniqueness => {:case_sensitive => false}
  validates :name, presence: true, length: {minimum: 1, maximum: 25}
  validates :background, presence: true
end
