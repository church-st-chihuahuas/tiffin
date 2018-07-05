class CreateChefs < ActiveRecord::Migration[5.2]
  def change
    create_table :chefs do |t|
      t.integer :user_id
      t.string :business_name
      t.text :business_description

      t.timestamps
    end
  end
end
