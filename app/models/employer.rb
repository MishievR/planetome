class Employer < ApplicationRecord

  has_many :employer_fields
  has_many :fields, through: :employer_fields
  has_many :jobs
  belongs_to :user

end
