class Train < ApplicationRecord
  belongs_to :current_station , class_name: 'RailwayStation', foreign_key: 'current_station_id'
  belongs_to :route, foreign_key: 'route_id'
end
