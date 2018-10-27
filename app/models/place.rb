class Place < ApplicationRecord
  mount_uploader :main_image, ImageUploader

  belongs_to :user
  belongs_to :city
end
