class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def dashboard
    @boat_profile_count = BoatProfile.count
    @listing_count = Listing.count
    @listing_price_count = ListingPrice.count
  end
end
