class ListingsController < ApplicationController
  def index
  end

  def create
    ScrapeBoatsOffersJob.perform_now
  end
end
