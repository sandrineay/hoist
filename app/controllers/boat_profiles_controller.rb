class BoatProfilesController < ApplicationController
  def index
    @boat_profiles = BoatProfile.all
  end

  def download
    @boat_profiles = BoatProfile.all

    respond_to do |format|
      format.html
      format.csv { send_data @boat_profiles.to_csv, filename: "boat-profiles-#{Date.today}.csv" }
    end
  end
end
