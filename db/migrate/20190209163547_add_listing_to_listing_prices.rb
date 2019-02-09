class AddListingToListingPrices < ActiveRecord::Migration[5.2]
  def change
    add_reference :listing_prices, :listing, foreign_key: true
  end
end
