class AddVerifyToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :verify, :boolean
  end
end
