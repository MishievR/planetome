class Project < ApplicationRecord

  acts_as_votable

  belongs_to :user
  mount_uploader :image, ImageUploader

  has_many :updates
  has_many :project_fields
  has_many :fields, through: :project_fields

  validates :name, :uniqueness => {:case_sensitive => false}
  validates :name, presence: true, length: {minimum: 1, maximum: 45}
  validates :description, presence: true, length: {minimum: 10, maximum: 160}
  # validates :image, presence: true

end
