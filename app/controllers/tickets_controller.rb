class TicketsController < ApplicationController
  before_action :find_train, only: %i[new create]

  def index
    @tickets = Ticket.all
  end

  def show; end

  def new
    # binding.pry
    @ticket = Ticket.new
    @first_station = RailwayStation.find(params[:first_station_id])
    @last_station = RailwayStation.find(params[:last_station_id])
  end

  def create
    # binding.pry
    @ticket = Ticket.new(ticket_params)
    if @ticket.save
      redirect_to ticket_path(@ticket)
    else
      redirect_to new_train_ticket_path(@train)
    end
  end


  private

  def find_train
    @train = Train.find(params[:train_id])
  end

  def ticket_params
    params.require(:ticket).permit( :train_id, :first_station_id, :last_station_id, :passport, :customer_id, :customer_name)
  end

end
