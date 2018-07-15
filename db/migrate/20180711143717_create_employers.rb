class CreateEmployers < ActiveRecord::Migration[5.0]
  def change
    create_table :employers do |t|
      t.string :company_name
      t.string :pitch
      t.text :about
      t.text :company_mission
      t.string :hq_location
      t.string :number_of_employees
      t.string :year_founded
      t.string :logo
      t.string :background
      t.string :link
      t.string :twitter
      t.string :facebook
      t.string :industry
      t.timestamps
    end
  end
end
