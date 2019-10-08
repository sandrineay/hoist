class AddModelToListings < ActiveRecord::Migration[5.2]
  def change
    add_column :listings, :model, :string
  end
end
