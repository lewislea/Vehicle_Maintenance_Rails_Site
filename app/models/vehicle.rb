class Vehicle < ActiveRecord::Base
  attr_accessible :vehicle
  attr_accessible :make, :model, :year, :mileage, :purchased_on
  has_many :repairs, :dependent => :destroy
  belongs_to :user

    default_scope order("created_at ASC")

  validates :year, :mileage, :numericality => true
  validates :make, :model, :year, :mileage, :purchased_on, :presence => true
end
