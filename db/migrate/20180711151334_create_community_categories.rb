class CreateCommunityCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :community_categories do |t|
      t.integer :community_id
      t.integer :category_id
      t.timestamps
    end
  end
end
