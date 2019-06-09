class CreatePlaces < ActiveRecord::Migration[5.2]
  def change
    create_table :places do |t|
      t.string :name 
      t.string :address 
      t.string :phone_number 
      t.string :website 
      t.string :category 
      
      t.timestamps
    end
  end
end
