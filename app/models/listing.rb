class Listing < ApplicationRecord
  belongs_to :boat_profile, optional: true
  has_many :listing_prices
end
