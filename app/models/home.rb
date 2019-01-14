class Home < ApplicationRecord
  mount_uploader :main_photo, ImageUploader
  mount_uploader :other_photo, ImageUploader

  belongs_to :user
  belongs_to :city

  geocoded_by :full_address
  after_validation :geocode
end
