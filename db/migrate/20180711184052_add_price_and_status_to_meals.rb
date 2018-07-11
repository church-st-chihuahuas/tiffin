class AddPriceAndStatusToMeals < ActiveRecord::Migration[5.2]
  def change
    add_column :meals, :price, :float
    add_column :meals, :active, :boolean
  end
end
