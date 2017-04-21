class RemoveLastnameAndCardnumberAndExpdateFromUsers < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :lastname, :string
    remove_column :users, :cardnumber, :string
    remove_column :users, :expdate, :date
  end
end
