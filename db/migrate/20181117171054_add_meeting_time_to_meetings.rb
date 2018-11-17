class AddMeetingTimeToMeetings < ActiveRecord::Migration[5.0]
  def change
    add_column :meetings, :meeting_time, :integer
  end
end
