class RailwayStation < ApplicationRecord
  has_many :railway_station_routes
  has_many :routes, :through => :railway_station_routes
  has_many :trains
  has_many :tickets
end
