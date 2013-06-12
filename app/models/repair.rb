class Repair < ActiveRecord::Base
  attr_accessible :repair
  belongs_to :vehicle
end
