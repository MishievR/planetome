class AddUserToCommunities < ActiveRecord::Migration[5.0]
  def change
    add_column :communities, :user_id, :integer
  end
end
