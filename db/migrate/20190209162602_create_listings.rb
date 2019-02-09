class CreateListings < ActiveRecord::Migration[5.2]
  def change
    create_table :listings do |t|
      t.string :website
      t.integer :website_uid

      t.timestamps
    end
  end
end
