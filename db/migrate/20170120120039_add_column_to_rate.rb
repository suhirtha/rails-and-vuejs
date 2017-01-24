class AddColumnToRate < ActiveRecord::Migration[5.0]
  def change
    add_column :rates, :company_id, :integer
    add_column :rates, :type_id, :integer
  end
end
