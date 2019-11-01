class Question < ApplicationRecord
  belongs_to :listing
  belongs_to :user
  has_one :answer, dependent: :destroy
  validates :body, :user_id, :listing_id, presence: true
end
