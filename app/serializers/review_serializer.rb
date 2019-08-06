class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :content
  belongs_to :place
end
