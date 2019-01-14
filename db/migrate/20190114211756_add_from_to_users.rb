class AddFromToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :originnaly_from_city, :string
    add_column :users, :currently_in_city, :string
  end
end
