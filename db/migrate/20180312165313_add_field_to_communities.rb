class AddFieldToCommunities < ActiveRecord::Migration[5.0]
  def change
    add_column :communities, :field_id, :integer
  end
end
