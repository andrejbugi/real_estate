class CreateSearches < ActiveRecord::Migration[6.0]
  def change
    create_table :searches do |t|
      t.string :keywords
      t.string :category
      t.string :location
      t.integer :min_price
      t.integer :max_price
      t.string :listing_type
      t.integer :bedroom
      t.integer :bathroom

      t.timestamps
    end
  end
end
