class CreateJoinTableAreasCompanies < ActiveRecord::Migration[5.0]
  def change
    create_join_table :areas, :companies do |t|
       t.index [:area_id, :company_id]
       t.index [:company_id, :area_id]
    end
  end
end
