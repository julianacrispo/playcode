class AddColumnsToVendors < ActiveRecord::Migration
  def change
    add_column :vendors, :website, :string
    add_column :vendors, :description, :text
  end
end
