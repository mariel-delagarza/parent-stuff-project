class Place < ApplicationRecord
  #has_many :features 
  has_many :reviews
  has_many :users, through :reviews 

  validates :name, presence: true
end
