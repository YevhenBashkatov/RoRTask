class AddInfoInTickets < ActiveRecord::Migration[6.0]
  def change
    add_column :tickets, :customer_name, :string
    add_column :tickets, :ticket_number, :string
  end
end
