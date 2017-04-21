class ChangePriceFromEvents < ActiveRecord::Migration[5.0]
  def change
    change_column :events, :price, :decimal, precision: 10, scale: 2
  end
end
