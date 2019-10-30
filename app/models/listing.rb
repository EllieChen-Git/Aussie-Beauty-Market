class Listing < ApplicationRecord
  belongs_to :user
  belongs_to :location
  has_many :questions, dependent: :destroy
  has_one_attached :pic
  enum category: { face: 0, eyes: 1, lips: 2, accessories: 3 } 
  validates :title, :brand, :price, :description, :category, presence: true
end
