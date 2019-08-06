class PlaceSerializer < ActiveModel::Serializer
  attributes :name, :address 
  has_many :reviews 
end
