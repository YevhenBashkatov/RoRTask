class Route < ActiveRecord::Base
  validates :name, presence: true
  validate :station_count

  has_many :railway_stations_routes
  has_many :railway_stations, through: :railway_stations_routes
  has_many :trains

  before_validation :set_name

  private

  def set_name
    self.name = "#{railway_stations.first.title}-#{railway_stations.last.title}"
  end

  def station_count
    errors.add(:base, 'Route should contain at least 2 stations') if railway_stations.size < 2
  end
end
