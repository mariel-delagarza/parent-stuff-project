class PlaceSerializer < ActiveModel::Serializer
  attributes :name, :address, :website, :phone_number, :category, :changing_tables, :family_bathroom, :high_chairs, :nursing_room
  has_many :reviews 
end
