class Category < ApplicationRecord

  has_many :job_categories
  has_many :jobs, through: :job_categories
  has_many :community_categories
  has_many :communities, through: :community_categories


  validates :title, presence: true, :uniqueness => {:case_sensitive => false}
  validates :about, length: {minimum: 1, maximum: 500}
end
