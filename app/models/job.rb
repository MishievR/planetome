class Job < ApplicationRecord

  belongs_to :employer
  has_many :job_categories
  has_many :categories, through: :job_categories
  has_many :community_jobs
  has_many :communities, through: :community_jobs

  validates :employer_id, presence: true
  validates :position, presence: true
  validates :impact, presence: true, length: {minimum: 1, maximum: 160}
  validates :link, presence: true
  validates :email_to_contact, presence: true
  validates_format_of :email_to_contact, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  validates :category_ids, presence: true

end
