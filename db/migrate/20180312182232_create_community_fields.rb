class CreateCommunityFields < ActiveRecord::Migration[5.0]
  def change
    create_table :community_fields do |t|
      t.integer :community_id
      t.integer :field_id
      t.timestamps
    end
  end
end
