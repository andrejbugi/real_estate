class CreateProperties < ActiveRecord::Migration[6.0]
  def change
    create_table :properties do |t|
      t.string :title
      t.text :description
      t.string :category
      t.integer :bedroom
      t.integer :bathroom
      t.integer :price
      t.string :location
      t.string :listing_type
      t.string :interior

      t.timestamps
    end
  end
end
