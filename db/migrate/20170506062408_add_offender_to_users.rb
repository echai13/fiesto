class AddOffenderToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :offender, :boolean
  end
end
