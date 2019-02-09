class AddColumnsToBoatProfiles < ActiveRecord::Migration[5.2]
  def change
    add_column :boat_profiles, :hull_material, :string
    add_column :boat_profiles, :rigging_type, :string
    add_column :boat_profiles, :ballast_type, :string
    add_column :boat_profiles, :keel_type, :string
    add_column :boat_profiles, :windlass_type, :string
    add_column :boat_profiles, :certification, :string
    add_column :boat_profiles, :builder, :string
    add_column :boat_profiles, :designer, :string
    add_column :boat_profiles, :type, :string
    add_column :boat_profiles, :class, :string
    add_column :boat_profiles, :cabins, :integer
    add_column :boat_profiles, :double_berths, :integer
    add_column :boat_profiles, :heads, :integer
    add_column :boat_profiles, :length_on_deck, :float
    add_column :boat_profiles, :loa, :float
    add_column :boat_profiles, :lwl, :float
    add_column :boat_profiles, :beam, :float
    add_column :boat_profiles, :sail_area, :float
    add_column :boat_profiles, :max_draft, :float
    add_column :boat_profiles, :min_draft, :float
    add_column :boat_profiles, :displacement, :float
    add_column :boat_profiles, :ballast, :float
    add_column :boat_profiles, :comfort_ratio, :float
    add_column :boat_profiles, :cabin_headroom, :float
    add_column :boat_profiles, :dry_weight, :float
    add_column :boat_profiles, :max_bridge_clearance, :float
    add_column :boat_profiles, :rig_i, :float
    add_column :boat_profiles, :rig_j, :float
    add_column :boat_profiles, :rig_p, :float
    add_column :boat_profiles, :rig_e, :float
    add_column :boat_profiles, :rig_spl_tps, :float
    add_column :boat_profiles, :rig_isp, :float
    add_column :boat_profiles, :fuel_type, :string
    add_column :boat_profiles, :engine_make, :string
    add_column :boat_profiles, :engine_model, :string
    add_column :boat_profiles, :horse_power, :integer
    add_column :boat_profiles, :engine_type, :string
    add_column :boat_profiles, :drive_type, :string
    add_column :boat_profiles, :propeller_type, :string
    add_column :boat_profiles, :propeller_material, :string
    add_column :boat_profiles, :engine_hours, :integer
    add_column :boat_profiles, :engine_year, :integer
    add_column :boat_profiles, :folding_propeller, :boolean
    add_column :boat_profiles, :holding_tank_capacity, :float
    add_column :boat_profiles, :holding_tank_number, :integer
    add_column :boat_profiles, :holding_tank_material, :string
    add_column :boat_profiles, :water_tank_capacity, :float
    add_column :boat_profiles, :water_tank_number, :integer
    add_column :boat_profiles, :water_tank_material, :string
    add_column :boat_profiles, :fuel_tank_capacity, :float
    add_column :boat_profiles, :fuel_tank_number, :integer
    add_column :boat_profiles, :fuel_tank_material, :string
    add_column :boat_profiles, :sa_disp, :float
    add_column :boat_profiles, :bal_disp, :float
    add_column :boat_profiles, :disp_len, :float
    add_column :boat_profiles, :first_built, :integer
    add_column :boat_profiles, :last_built, :integer
    add_column :boat_profiles, :number_built, :integer
  end
end
