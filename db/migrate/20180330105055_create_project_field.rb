class CreateProjectField < ActiveRecord::Migration[5.0]
  def change
    create_table :project_fields do |t|
      t.integer :project_id
      t.integer :field_id
      t.timestamps
    end
  end
end
