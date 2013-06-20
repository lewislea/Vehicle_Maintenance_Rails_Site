class Vehicle < ActiveRecord::Base
  attr_accessible :vehicle
  attr_accessible :make, :model, :year, :mileage, :purchased_on
  has_many :repairs
  belongs_to :user

  # validates :make, :model, :year, :mileage, :purchased_on, :presence => true
  validates :year, :mileage, :numericality => true
  validates :make, :model, :year, :mileage, :purchased_on, :presence => true
end
