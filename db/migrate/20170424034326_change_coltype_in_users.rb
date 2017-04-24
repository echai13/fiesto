class ChangeColtypeInUsers < ActiveRecord::Migration[5.0]
  def change
    change_column :users, :customer_id, :string
    change_column :users, :account_id, :string
  end
end
