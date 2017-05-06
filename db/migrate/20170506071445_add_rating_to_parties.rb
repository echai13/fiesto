class AddRatingToParties < ActiveRecord::Migration[5.0]
  def change
    add_column :parties, :rating, :integer
    add_column :parties, :comment, :string
  end
end
