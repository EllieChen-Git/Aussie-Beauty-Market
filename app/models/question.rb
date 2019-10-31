class Question < ApplicationRecord
  belongs_to :listing
  belongs_to :user
  has_one :answer, dependent: :destroy
  # accepts_nested_attributes_for :answer
end
