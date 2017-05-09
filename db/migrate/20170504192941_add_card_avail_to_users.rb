class AddCardAvailToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :card_avail, :boolean
  end
end
