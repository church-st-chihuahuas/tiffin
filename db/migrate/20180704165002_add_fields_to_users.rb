class AddFieldsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :contact_phone, :string
    add_column :users, :street_address, :string
    add_column :users, :city, :string
    add_column :users, :state, :string
    add_column :users, :zip, :string
  end
end
