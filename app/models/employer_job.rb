class EmployerJob < ActiveRecord::Base
  belongs_to :employer
  belongs_to :job
end
