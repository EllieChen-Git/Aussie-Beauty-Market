class CreateSearches < ActiveRecord::Migration[5.2]
  def change
    create_table :searches do |t|
      t.string :brand
      t.integer :category
      t.integer :min_price
      t.integer :max_price

      t.timestamps
    end
  end
end
