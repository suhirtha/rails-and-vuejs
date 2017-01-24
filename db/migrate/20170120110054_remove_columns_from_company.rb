class RemoveColumnsFromCompany < ActiveRecord::Migration[5.0]
  def change
    remove_column :companies, :room, :integer
    remove_column :companies, :price, :decimal
  end
end
