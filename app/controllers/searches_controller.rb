class SearchesController < ApplicationController
  def show
    @railway_stations = RailwayStation.all
  end

  def search
    @first_station = RailwayStation.find(params[:first_station_id])
    @last_station = RailwayStation.find(params[:last_station_id])
    @routes = Route.find_by_stations(@first_station, @last_station)
  end
end
