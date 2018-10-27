class ChangeTypeInPlaces < ActiveRecord::Migration[5.0]
  def change
    add_column :places, :place_type, :string
  end
end
