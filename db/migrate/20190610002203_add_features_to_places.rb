class AddFeaturesToPlaces < ActiveRecord::Migration[5.2]
  def change
    add_column :places, :changing_tables, :boolean
    add_column :places, :family_bathroom, :boolean
    add_column :places, :high_chairs, :boolean
    add_column :places, :nursing_room, :boolean
  end
end
