class RailwayCarriage < ApplicationRecord
  validates :number, presence: true
  validates :number, uniqueness: { scope: :train_id }
  belongs_to :train


  $CARRIAGE_TYPES = %w(ComfortRailwayCarriage CoupeRailwayCarriage EconomyRailwayCarriage HundaiRailwayCarriage)

  before_validation :set_number
  after_update :number_correcting_after_update

  private

  def set_number
    self.number = train.railway_carriages.size + 1
  end
  def number_correcting_after_update
    self.number = self.number.to_i - 1
  end
end
