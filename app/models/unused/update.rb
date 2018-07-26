class Update < ApplicationRecord

  belongs_to :project

  validates :name, presence: true, length: {minimum: 1, maximum: 45}
end
