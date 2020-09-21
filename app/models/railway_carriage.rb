class RailwayCarriage < ApplicationRecord
  validates :number, :carriage_type, :seats_up, :seats_down, presence: true
  belongs_to :train
end
