class CreateLocations < ActiveRecord::Migration[5.2]
  def change
    create_table :locations do |t|
      t.string :suburb
      t.string :postcode
      t.string :state

      t.timestamps
    end
  end
end
