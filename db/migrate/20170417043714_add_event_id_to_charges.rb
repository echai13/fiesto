class AddEventIdToCharges < ActiveRecord::Migration[5.0]
  def change
    add_column :charges, :event_id, :integer
  end
end
