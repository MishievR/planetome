class AddArchivedToProjects < ActiveRecord::Migration[6.0]
  def change
    add_column :projects, :archived, :boolean, default: false
    add_column :projects, :archived_at_time, :datetime
    add_column :projects, :archived_reason, :text
  end
end
