class CreateHomes < ActiveRecord::Migration[5.0]
  def change
    create_table :homes do |t|
    	t.string :name
    	t.text :about
    	t.text :features
    	t.string :type
    	t.string :capacity
    	t.string :full_address
    	t.string :main_photo
    	t.string :other_photo
    	t.string :video_url
    	t.integer :city_id
    	t.integer :user_id

    	t.timestamps
    end
  end
end
