class AddVendorNameToVendors < ActiveRecord::Migration
  def change
    add_column :vendors, :vendor_name, :string
  end
end
