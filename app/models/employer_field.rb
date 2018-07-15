class EmployerField < ActiveRecord::Base
  belongs_to :employer
  belongs_to :field
end
