class CreateCovidpoints < ActiveRecord::Migration[6.0]
  def change
    create_table :covidpoints do |t|
      t.string :location
      t.string :country_code
      t.decimal :latitude, precision: 17, scale: 14
      t.decimal :longitude, precision: 17, scale: 14
      t.integer :confirmed
      t.integer :dead

      t.timestamps
    end
  end
end
