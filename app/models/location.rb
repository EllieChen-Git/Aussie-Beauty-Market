class Location < ApplicationRecord
    has_many :listings, dependent: :destroy
    validates :state, :postcode, :suburb, presence: true
end
