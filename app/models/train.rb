class Train < ApplicationRecord
  validates :number, presence: true
  belongs_to :current_station, class_name: 'RailwayStation', foreign_key: 'current_station_id'
  belongs_to :route, foreign_key: 'route_id'
  has_many :railway_carriages

  def seats_by_type(railway_carriage_type, seats_type)
    railway_carriages.where(type: railway_carriage_type.sum(seats_type))
  end

  private

  def carriages_count
    railway_carriages.size
  end
end
