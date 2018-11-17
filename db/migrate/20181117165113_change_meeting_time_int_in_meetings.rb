class ChangeMeetingTimeIntInMeetings < ActiveRecord::Migration[5.0]
  def up
    change_column :meetings, :meeting_time, :integer, using: 'meeting_time::integer'
  end
  def down
    change_column :meetings, :meeting_time, :integer
  end
end
