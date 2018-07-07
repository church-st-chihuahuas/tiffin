class AddDietaryAccommodationsChefsJoinTable < ActiveRecord::Migration[5.2]
  def change
    create_table :dietary_accommodations_chefs, :id => false do |t|
      t.integer :dietary_accommodation_id
      t.integer :chef_id
    end
  end
end
