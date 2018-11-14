class CreateMeetings < ActiveRecord::Migration[5.0]
  def change
    create_table :meetings do |t|
      t.integer :meeting_with
      t.integer :meeting_from
      t.integer :main_topic_id
      t.string :meeting_time
      t.text :meeting_comment

      t.timestamps
    end
  end
end
