class AddVendorToComments < ActiveRecord::Migration
  def change
    add_column :comments, :vendor_id, :integer
  end
end
