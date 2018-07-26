class Employer < ApplicationRecord

  has_many :employer_fields
  has_many :fields, through: :employer_fields
  has_many :jobs
  belongs_to :user

  validates :company_name, :uniqueness => {:case_sensitive => false}
  validates :company_name, presence: true, length: {minimum: 1, maximum: 60}
  validates :pitch, presence: true, length: {minimum: 1, maximum: 160}
  validates :about, presence: true
  validates :link, presence: true

end
