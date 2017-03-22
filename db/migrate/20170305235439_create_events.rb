class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :name
      t.date :date
      t.time :time
      t.string :location
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
