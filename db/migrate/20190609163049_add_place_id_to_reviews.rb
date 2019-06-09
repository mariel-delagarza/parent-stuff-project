class AddPlaceIdToReviews < ActiveRecord::Migration[5.2]
  def change
    add_column :reviews, :place_id, :integer
  end
end
