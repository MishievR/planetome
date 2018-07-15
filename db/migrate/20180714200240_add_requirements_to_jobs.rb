class AddRequirementsToJobs < ActiveRecord::Migration[5.0]
  def change
    add_column :jobs, :requirements, :text
  end
end
