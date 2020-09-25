class AddColumnSortingToTrain < ActiveRecord::Migration[6.0]
  def change
    add_column :trains, :sorted, :boolean, default: false
  end
end
