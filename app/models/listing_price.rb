class ListingPrice < ApplicationRecord
  belongs_to :listing, optional: true
end
