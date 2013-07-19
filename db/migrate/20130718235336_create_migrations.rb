class CreateMigrations < ActiveRecord::Migration
  def change
    create_table :weathers do |t|
      t.date :date
      t.float :weather_low
      t.float :weather_high

      t.timestamps
    end
  end
end
