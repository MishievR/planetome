class CreateCities < ActiveRecord::Migration[5.0]
  def change
    create_table :cities do |t|
      t.string :name
      t.string :country
      t.string :background
      t.integer :rating
      t.string :status

      t.timestamps
    end
  end
end
