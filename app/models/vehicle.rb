class Vehicle < ActiveRecord::Base
  attr_accessible :vehicle
  attr_accessible :make, :model, :year, :mileage, :purchased_on
  has_many :repairs
  belongs_to :user

  before_validation :strip_commas_from_mileage

  validates :year, :mileage, :numericality => true
  validates :make, :model, :year, :mileage, :purchased_on, :presence => true

  def strip_commas_from_mileage
    self.mileage = self.mileage.to_s.gsub(/,/, '').to_f
  end

end
