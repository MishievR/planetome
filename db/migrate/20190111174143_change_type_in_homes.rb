class ChangeTypeInHomes < ActiveRecord::Migration[5.0]
  def change
    remove_column :homes, :type, :string
  end
end
