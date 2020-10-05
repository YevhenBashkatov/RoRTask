# frozen_string_literal: true

class Route < ActiveRecord::Base
  validates :name, presence: true
  validate :station_count

  has_many :railway_stations_routes
  has_many :railway_stations, through: :railway_stations_routes
  has_many :trains

  before_validation :set_name

  scope :include_station, ->(railway_station) { Route.joins(:railway_stations).where('railway_station_id = ?', railway_station.id) }

  def self.find_by_stations(first_station, last_station)
    Route.include_station(first_station) & Route.include_station(last_station)
  end

  private

  def set_name
    self.name = "#{railway_stations.first.title}-#{railway_stations.last.title}"
  end

  def station_count
    errors.add(:base, 'Route should contain at least 2 stations') if railway_stations.size < 2
  end
end
