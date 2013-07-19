class StaticPagesController < ApplicationController
  def index
  end
  def data
    @weather = Weather.all
    @x = []
    
    @weather.each do |x|
      b = {}
      b[:date] = x[:date]
      b[:max] = x[:weather_high]
      b[:min] = x[:weather_low]
      @x << b 
    end
    render layout: false
  end


  def location
    a = ForecastIO.forecast(params[:location][:latitude], params[:location][:longitude])
    @x = []
    a.daily.data.each do |x|
      b = {}
      b[:date] = Time.at(x.time)
      b[:max] = x.temperatureMin
      b[:min] = x.temperatureMax
      @x << b 
    end
    render layout: false
  end
end
