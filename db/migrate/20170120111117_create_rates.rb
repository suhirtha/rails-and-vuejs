class CreateRates < ActiveRecord::Migration[5.0]
  def change
    create_table :rates do |t|
      t.integer :room
      t.decimal :price

      t.timestamps
    end
  end
end
