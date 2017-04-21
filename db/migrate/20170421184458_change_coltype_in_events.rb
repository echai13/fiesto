class ChangeColtypeInEvents < ActiveRecord::Migration[5.0]
  def change
    change_column :events, :routing, :string
    change_column :events, :account, :string
  end
end
