class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.references :user
      t.timestamps
    end

    add_index :companies, :user_id
  end
end
