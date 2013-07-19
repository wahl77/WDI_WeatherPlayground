# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#"time","summary","icon","sunriseTime","sunsetTime","precipIntensity","precipIntensityMax","precipProbability","temperatureMin","temperatureMinTime","temperatureMax","temperatureMaxTime","dewPoint","windSpeed"

#"1374130800","Partly cloudy throughout the day.","partly-cloudy-day","1374152592","1374204653","0","0","0","53.85","1374148800","64.69","1374192000","53.02","8.42","274","0.41","0.86","1016.5","9.26","307.06"

Weather.destroy_all
file_path = File.join(Rails.root, "public", "sf.csv")

a = Roo::Spreadsheet.open(file_path)

a.each({:date => "time", :weather_high => "temperatureMax", :weather_min => "temperatureMin"}) do |x|
  
  Weather.create(:date => Time.at(x[:date].to_i).to_date, :weather_high => x[:weather_high].to_f, :weather_low => x[:weather_min].to_f)
end

Weather.first.destroy
puts Weather.count
