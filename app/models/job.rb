class Job < ApplicationRecord

  belongs_to :employer
  has_many :job_categories
  has_many :categories, through: :job_categories
  has_many :community_jobs
  has_many :communities, through: :community_jobs

  validates :position, presence: true
  validates :impact, presence: true, length: {minimum: 1, maximum: 100}
  validates :job_description, presence: true, length: {minimum: 140}
  validates :link, presence: true
end
