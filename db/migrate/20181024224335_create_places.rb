class CreatePlaces < ActiveRecord::Migration[5.0]
  def change
    create_table :places do |t|
      t.string :name
      t.text :description
      t.string :main_image
      t.integer :rating
      t.string :type
      t.string :link
      t.integer :price
      t.integer :user_id
      t.decimal :longitude, { precision: 10, scale: 6 }
      t.decimal :latitude, { precision: 10, scale: 6 }
      t.string :full_address
      t.integer :city_id

      t.boolean :is_free_wifi, default: false
      t.boolean :is_good_for_laptop, default: false
      t.boolean :is_free_entrance, default: false
      t.boolean :is_outlets_available, default: false
      t.boolean :is_whiteboard_available, default: false
      t.boolean :is_good_coffee, default: false
      t.boolean :is_nice_staff, default: false
      t.boolean :is_good_for_meetings, default: false
      t.boolean :is_good_location, default: false

      t.timestamps
    end
  end
end
