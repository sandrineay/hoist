class CreateBoatProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :boat_profiles do |t|
      t.string :make
      t.string :model
      t.string :hull_type

      t.timestamps
    end
  end
end
