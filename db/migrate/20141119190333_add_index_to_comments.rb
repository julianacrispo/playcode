class AddIndexToComments < ActiveRecord::Migration
  def up
    add_index :comments, :vendor_id
  end

  def down
    remove_index :comments, column: :vendor_id
  end

end
