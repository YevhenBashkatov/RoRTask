class RailwayStationRoute < ApplicationRecord
  belongs_to :railway_station, foreign_key: 'railway_station_id'
  belongs_to :route, foreign_key: 'route_id'
end
