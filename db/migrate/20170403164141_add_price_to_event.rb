class AddPriceToEvent < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :price, :decimal
  end
end
