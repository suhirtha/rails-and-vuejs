class CreateCitiesAreas < ActiveRecord::Migration[5.0]
  def change
    create_table :cities_areas do |t|
      t.integer :city_id
      t.integer :area_id

      t.timestamps
    end
  end
end
