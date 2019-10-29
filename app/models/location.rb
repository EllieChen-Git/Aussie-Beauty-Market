class Location < ApplicationRecord
    has_many :listings, dependent: :destroy
end
