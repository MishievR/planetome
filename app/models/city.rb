class City < ApplicationRecord
  mount_uploader :background, ImageUploader

  has_many :places
  has_many :users

  validates :name, :uniqueness => {:case_sensitive => false}
  validates :name, presence: true, length: {minimum: 1, maximum: 50}
  validates :country, presence: true, length: {minimum: 2, maximum: 100}
end
