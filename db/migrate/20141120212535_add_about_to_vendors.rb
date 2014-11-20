class AddAboutToVendors < ActiveRecord::Migration
  def change
    add_column :vendors, :about , :text
  end
end
