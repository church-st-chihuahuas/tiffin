class AddCuisinesChefsJoinTable < ActiveRecord::Migration[5.2]
  def change
    create_table :cuisines_chefs, :id => false do |t|
      t.integer :cuisine_id
      t.integer :chef_id
    end
  end
end
