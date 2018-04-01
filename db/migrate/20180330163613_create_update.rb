class CreateUpdate < ActiveRecord::Migration[5.0]
  def change
    create_table :updates do |t|
      t.string :name
      t.text :description
      t.integer :project_id
      t.timestamps
    end
  end
end
