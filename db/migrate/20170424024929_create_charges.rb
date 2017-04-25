class CreateCharges < ActiveRecord::Migration[5.0]
  def change
    create_table :charges do |t|
      t.string :email
      t.integer :event_id

      t.timestamps
    end
  end
end
