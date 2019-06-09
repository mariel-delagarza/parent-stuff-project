class AddPlaceIdToFeatures < ActiveRecord::Migration[5.2]
  def change
    add_column :features, :place_id, :integer
  end
end
