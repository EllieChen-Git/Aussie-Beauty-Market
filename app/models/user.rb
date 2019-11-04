class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :listings, dependent: :destroy
  has_many :questions, dependent: :destroy
  has_one_attached :pic
  enum skin_type: { oily: 0, normal: 1, dry: 2, combo: 3 } 
  has_many :purchases
end
