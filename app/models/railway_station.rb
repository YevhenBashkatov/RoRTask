class RailwayStation < ApplicationRecord
  has_many :railway_stations_routes
  has_many :routes, through: :railway_stations_routes
  has_many :trains
  has_many :tickets

  validates :title, presence: true

  scope :sorted, -> { joins(:railway_stations_routes).order('railway_stations_routes.position').uniq }
end
