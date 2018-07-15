class AddCompanyidToJobs < ActiveRecord::Migration[5.0]
  def change
    add_column :jobs, :employer_id, :integer

  end
end
