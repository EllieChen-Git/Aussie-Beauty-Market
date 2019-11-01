class Listing < ApplicationRecord
  belongs_to :user
  belongs_to :location
  accepts_nested_attributes_for :location
  has_many :questions, dependent: :destroy
  has_one_attached :pic
  enum category: { face: 0, eyes: 1, lips: 2, accessories: 3 } 
  validates :title, :brand, :price, :category, :description, :user_id, :pic, presence: true
  # validates_presence_of :location
  # validates_associated :location
end
