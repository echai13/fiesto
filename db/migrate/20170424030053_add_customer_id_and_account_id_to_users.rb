class AddCustomerIdAndAccountIdToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :customer_id, :integer
    add_column :users, :account_id, :integer
  end
end
