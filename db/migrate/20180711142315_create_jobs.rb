class CreateJobs < ActiveRecord::Migration[5.0]
  def change
    create_table :jobs do |t|
      t.string :position
      t.text :purpose
      t.text :impact
      t.string :location
      t.boolean :is_remote, default: false
      t.boolean :is_special_requirements, default: false
      t.text :special_requirements
      t.text :responsibilities
      t.text :job_description
      t.string :link
      t.string :email_to_contact
      t.integer :salary
      t.timestamps
    end
  end
end
