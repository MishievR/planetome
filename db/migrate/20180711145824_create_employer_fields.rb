class CreateEmployerFields < ActiveRecord::Migration[5.0]
  def change
    create_table :employer_fields do |t|
      t.integer :employer_id
      t.integer :field_id
      t.timestamps
    end
  end
end
