class ChangeNumberTypeInRailwayCarriage < ActiveRecord::Migration[6.0]
  def change
    change_column :railway_carriages, :number, :integer, using: 'number::integer'
  end
end
