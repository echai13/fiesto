class AddRoutingAccountPriceToEvents < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :routing, :string
    add_column :events, :account, :string
    add_column :events, :price, :decimal, precision: 10, scale: 2
  end
end
