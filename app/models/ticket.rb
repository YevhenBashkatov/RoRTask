class Ticket < ApplicationRecord
  belongs_to :customer
  belongs_to :train
  belongs_to :first_station, class_name: 'RailwayStation', foreign_key: 'first_station_id'
  belongs_to :last_station, class_name: 'RailwayStation', foreign_key: 'first_station_id'
end
