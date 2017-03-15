class AddPicturesToEvents < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :pictures, :string
  end
end
