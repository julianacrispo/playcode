class AddEmailPermissionToUsers < ActiveRecord::Migration
  def change
    add_column :users, :email_follows, :boolean, default: true
  end
end
