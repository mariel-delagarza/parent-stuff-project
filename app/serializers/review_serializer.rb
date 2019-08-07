class ReviewSerializer < ActiveModel::Serializer
  attributes :content
  belongs_to :place
end
