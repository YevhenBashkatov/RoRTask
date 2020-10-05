class AddStationsInTicket < ActiveRecord::Migration[6.0]
  def change
    add_belongs_to :tickets, :first_station
    add_belongs_to :tickets, :last_station
  end
end
