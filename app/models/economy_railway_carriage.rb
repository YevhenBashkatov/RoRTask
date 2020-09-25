class EconomyRailwayCarriage < RailwayCarriage
  validates  :seats_down, :seats_up, :side_seats_down, :side_seats_up, presence:true
end