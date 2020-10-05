class ChangeTicketNumberInTicket < ActiveRecord::Migration[6.0]
  def change
    rename_column :tickets, :ticket_number, :passport
  end
end
