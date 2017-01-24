class RemoveColumnFromArea < ActiveRecord::Migration[5.0]
  def change
    remove_column :areas, :company_id, :integer
  end
end
