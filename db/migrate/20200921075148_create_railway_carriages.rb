class CreateRailwayCarriages < ActiveRecord::Migration[6.0]
  def change
    create_table :railway_carriages do |t|
      t.string :number
      t.integer :side_seats_up
      t.integer :side_seats_down
      t.integer :sitting_seats
      t.integer :seats_up
      t.integer :seats_down
      t.string :type
      t.belongs_to :train
      t.timestamps
    end
  end
end
