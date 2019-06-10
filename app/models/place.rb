class Place < ApplicationRecord 
  has_many :reviews
  has_many :users, through: :reviews 

  validates :name, presence: true
  validates :address, presence: true, uniqueness: true 

  CATEGORY=['Store', 'Restaurant', 'Other']
end
