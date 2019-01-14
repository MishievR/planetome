class AddHomeTypeToHomes < ActiveRecord::Migration[5.0]
  def change
    add_column :homes, :home_type, :string
  end
end
