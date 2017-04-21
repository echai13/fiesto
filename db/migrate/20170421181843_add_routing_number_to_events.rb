class AddRoutingNumberToEvents < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :routing, :integer
  end
end
