class CreateFeatures < ActiveRecord::Migration[5.2]
  def change
    create_table :features do |t|
      t.boolean :changing_tables
      t.boolean :family_bathroom
      t.boolean :high_chairs
      t.boolean :nursing_room
      
      t.timestamps
    end
  end
end
