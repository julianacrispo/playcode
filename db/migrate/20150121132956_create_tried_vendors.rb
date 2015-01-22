class CreateTriedVendors < ActiveRecord::Migration
  def change
    create_table :tried_vendors do |t|
      t.references :vendor, null: false

      t.timestamps
    end
  end
end
