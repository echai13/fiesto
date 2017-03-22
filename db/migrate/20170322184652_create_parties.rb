class CreateParties < ActiveRecord::Migration[5.0]
  def change
    create_table :parties do |t|
      t.belongs_to :user, index: true
      t.belongs_to :event, index: true
      t.timestamps
    end
  end
end
