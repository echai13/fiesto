class RemoveRoutingAndAccountFromEvents < ActiveRecord::Migration[5.0]
  def change
    remove_column :events, :routing, :string
    remove_column :events, :account, :string
  end
end
