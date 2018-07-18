class CreateCommunityJobs < ActiveRecord::Migration[5.0]
  def change
    create_table :community_jobs do |t|
      t.integer :job_id
      t.integer :community_id
      t.timestamps
    end
  end
end
