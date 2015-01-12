class AddFacilityIdToDepartments < ActiveRecord::Migration
  def change
    add_column :departments, :facility_id, :integer
  end
end
