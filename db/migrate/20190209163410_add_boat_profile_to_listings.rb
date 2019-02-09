class AddBoatProfileToListings < ActiveRecord::Migration[5.2]
  def change
    add_reference :listings, :boat_profile, foreign_key: true
  end
end
