class AddColumnToArea < ActiveRecord::Migration[5.0]
  def change
    add_column :areas, :company_id, :integer
  end
end
