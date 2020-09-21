class CreateRailwayCarriages < ActiveRecord::Migration[6.0]
  def change
    create_table :railway_carriages do |t|
      t.string :number
      t.string :carriage_type
      t.integer :seats_up
      t.integer :seats_down
      t.timestamps
    end
  end
end
