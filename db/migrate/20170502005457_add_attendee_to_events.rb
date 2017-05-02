class AddAttendeeToEvents < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :attendees, :integer
  end
end
