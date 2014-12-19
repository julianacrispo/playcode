class CreateFollows < ActiveRecord::Migration
  def change
    create_table :follows do |t|
      t.references :product
      t.references :user

      t.timestamps
    end
    add_index :follows, :product_id
    add_index :follows, :user_id
  end
end
