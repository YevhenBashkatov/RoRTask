class AddCustomerIdToTicket < ActiveRecord::Migration[6.0]
  def change
    add_belongs_to :tickets, :customer
  end
end
