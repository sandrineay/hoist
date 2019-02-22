require 'csv'

class BoatProfile < ApplicationRecord
  has_many :listings

  def self.to_csv
    attributes = %w{
      make
      model
      hull_type
      created_at
      updated_at
      hull_material
      rigging_type
      ballast_type
      keel_type
      windlass_type
      certification
      builder
      designer
      boat_type
      boat_class
      cabins
      double_berths
      heads
      length_on_deck
      loa
      lwl
      beam
      sail_area
      max_draft
      min_draft
      displacement
      ballast
      comfort_ratio
      cabin_headroom
      dry_weight
      max_bridge_clearance
      rig_i
      rig_j
      rig_p
      rig_e
      rig_spl_tps
      rig_isp
      fuel_type
      engine_make
      engine_model
      horse_power
      engine_type
      drive_type
      propeller_type
      propeller_material
      engine_hours
      engine_year
      folding_propeller
      holding_tank_capacity
      holding_tank_number
      holding_tank_material
      water_tank_capacity
      water_tank_number
      water_tank_material
      fuel_tank_capacity
      fuel_tank_number
      fuel_tank_material
      sa_disp
      bal_disp
      disp_len
      first_built
      last_built
      number_built
    }

    CSV.generate(headers: true) do |csv|
      csv << attributes

      all.each do |boat_profile|
        csv << attributes.map{|attr| boat_profile.send(attr)}
      end
    end
  end
end

