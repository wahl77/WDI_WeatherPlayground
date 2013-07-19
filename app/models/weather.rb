class Weather < ActiveRecord::Base
  attr_accessible :date, :weather_high, :weather_low
end
