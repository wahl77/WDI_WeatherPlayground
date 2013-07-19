# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :migration do
    date "2013-07-18"
    weather_low 1.5
    weather_high 1.5
  end
end
