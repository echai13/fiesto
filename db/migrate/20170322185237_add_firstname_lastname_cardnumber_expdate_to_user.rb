class AddFirstnameLastnameCardnumberExpdateToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :firstname, :string
    add_column :users, :lastname, :string
    add_column :users, :cardnumber, :string
    add_column :users, :expdate, :date
  end
end
