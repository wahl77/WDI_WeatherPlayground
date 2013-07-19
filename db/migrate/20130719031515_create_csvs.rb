class CreateCsvs < ActiveRecord::Migration
  def change
    create_table :blahs do |t|
      t.string :url

      t.timestamps
    end
  end
end
