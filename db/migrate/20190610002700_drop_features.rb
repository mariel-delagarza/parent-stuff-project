class DropFeatures < ActiveRecord::Migration[5.2]
  def change
    drop_table :features
  end
end
