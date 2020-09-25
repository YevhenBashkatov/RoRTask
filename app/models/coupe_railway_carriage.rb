class CoupeRailwayCarriage < RailwayCarriage
  validates :seats_up, :seats_down, presence: true
end