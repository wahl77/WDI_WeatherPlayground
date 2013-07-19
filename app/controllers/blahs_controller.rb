class BlahsController < ApplicationController

  def new
    @csv = Blahs.new
  end

  def create
    csv = Blah.new(params[:csv])
    if csv.save
      redirect_to blah_path(csv)
    else
      redirect_to root_path
    end
  end

  def show
    @csv = Blah.find(params[:id])
  end

  def blah
    require "roo"
    @weather = Weather.all
    @x = []
    

    file_path = File.join(Rails.root, "public", "uploads", "csv", "url", params[:id], "file.csv")

    a = Roo::Spreadsheet.open(file_path)

    a.each({:date => "time", :weather_high => "temperatureMax", :weather_min => "temperatureMin"}) do |x, index|
      b = {}
      b[:date] = Time.at(x[:date].to_i).to_date
      b[:max] =  x[:weather_high].to_f
      b[:min] = x[:weather_min].to_f
      @x << b 
    end
    render layout: false
  end
end
