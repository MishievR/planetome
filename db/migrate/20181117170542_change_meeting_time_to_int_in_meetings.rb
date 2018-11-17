class ChangeMeetingTimeToIntInMeetings < ActiveRecord::Migration[5.0]
  def change
    remove_column :meetings, :meeting_time
  end
end
