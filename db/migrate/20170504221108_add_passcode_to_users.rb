class AddPasscodeToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :passcode, :integer
  end
end
