class Listing < ApplicationRecord
  belongs_to :user
  belongs_to :location
  has_one_attached :pic
  has_many :questions, dependent: :destroy
  enum category: { face: 0, eyes: 1, lips: 2, accessories: 3 }  
end
