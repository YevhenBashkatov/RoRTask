class RailwayCarriage < ApplicationRecord
  validates :number, presence: true
  validates :number, uniqueness: { scope: :train_id }
  belongs_to :train

  before_validation :set_number

  private

  def set_number
    self.number = train.railway_carriages.size + 1
  end
end
