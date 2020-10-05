class RailwayCarriage < ApplicationRecord
  # validates :number, presence: true
  validates :number, uniqueness: { scope: :train_id }
  belongs_to :train


  $CARRIAGE_TYPES = %w(ComfortRailwayCarriage CoupeRailwayCarriage EconomyRailwayCarriage HundaiRailwayCarriage)

  # before_validation :set_number
  before_create :set_number

  private

  def set_number
     self.number = count_carriages.to_i + 1
  end

  def count_carriages
    train.railway_carriages.all.map(&:number).max || 0
  end
end
