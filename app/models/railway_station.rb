class RailwayStation < ApplicationRecord
  has_many :railway_stations_routes
  has_many :routes, through: :railway_stations_routes
  has_many :trains
  has_many :tickets

  validates :title, presence: true

  def update_position(route, position)
    station_route = station_route(route)
    station_route&.update(position: position)
  end

  def position_in(route)
    station_route(route).try(:position)
  end

  def update_arrive_time(route, arrive_time)
    station_route = station_route(route)
    station_route&.update(arrive_time: arrive_time)
  end

  def arrive_time_in(route)
    station_route(route).try(:arrive_time)
  end

  def update_departure_time(route, departure_time)
    station_route = station_route(route)
    station_route&.update(departure_time: departure_time)
  end

  def departure_time_in(route)
    station_route(route).try(:departure_time)
  end




  scope :sorted, -> { joins(:railway_stations_routes).order('railway_stations_routes.position').uniq }

  protected

  def station_route(route)
    @station_route ||= railway_stations_routes.where(route: route).first
  end
end
