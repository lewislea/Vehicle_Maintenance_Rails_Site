class Repair < ActiveRecord::Base
  attr_accessible :repair
  attr_accessible :repair_type, :mileage, :date, :mechanic, :cost, :notes
  belongs_to :vehicle

  default_scope order("created_at ASC")

  validates :mileage, :numericality => true
  validates :vehicle_id, :repair_type, :mechanic, :mileage, :date, :cost, :presence => true
end
