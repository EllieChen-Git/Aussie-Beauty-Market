class Search < ApplicationRecord
    enum category: { face: 0, eyes: 1, lips: 2, accessories: 3 } 

    def search_listings
        listings = Listing.all

        listings = listings.where("brand LIKE ?", "%#{brand}%") if brand.present?
        listings = listings.where(category: category) if category.present?
        listings = listings.where("price >= ?", min_price) if min_price.present?
        listings = listings.where("price <= ?", max_price) if max_price.present?
        return listings
    end
end
