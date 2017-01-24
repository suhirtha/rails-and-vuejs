class CreateAreas < ActiveRecord::Migration[5.0]
  def change
    create_table :areas do |t|
      t.string :name
      t.integer :city_id

      t.timestamps
    end
  end
end
