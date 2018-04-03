class ChangeAvatarInUsers < ActiveRecord::Migration[5.0]
  def up
    change_column :users, :avatar, :string
  end
  def down
    change_column :users, :avatar, :string, default: "https://storage.googleapis.com/startups-space-images/uploads/user/default/profile-image-default.png"
  end
end
