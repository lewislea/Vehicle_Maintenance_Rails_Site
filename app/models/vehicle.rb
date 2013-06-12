class Vehicle < ActiveRecord::Base
  attr_accessible :Vehicle
  has_many :repairs
end
