class AddMakeToListings < ActiveRecord::Migration[5.2]
  def change
    add_column :listings, :make, :string
  end
end
