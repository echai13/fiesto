class AddAccountNumberToEvents < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :account, :integer
  end
end
