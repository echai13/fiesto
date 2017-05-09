class AddAttendedToParties < ActiveRecord::Migration[5.0]
  def change
    add_column :parties, :attended, :boolean
  end
end
