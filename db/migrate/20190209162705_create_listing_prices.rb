class CreateListingPrices < ActiveRecord::Migration[5.2]
  def change
    create_table :listing_prices do |t|
      t.integer :ask_price
      t.string :currency
      t.string :status

      t.timestamps
    end
  end
end
