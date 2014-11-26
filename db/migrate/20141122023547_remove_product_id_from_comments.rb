class RemoveProductIdFromComments < ActiveRecord::Migration
  def change
    remove_column :comments, :product_id, :integer
    remove_column :comments, :vendor_id, :integer
  end
end
