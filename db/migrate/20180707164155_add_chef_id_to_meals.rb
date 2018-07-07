class AddChefIdToMeals < ActiveRecord::Migration[5.2]
  def change
    add_column :meals, :chef_id, :int
  end
end
