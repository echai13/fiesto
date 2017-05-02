class RemoveAttendeesFromUsers < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :attendees
  end
end
