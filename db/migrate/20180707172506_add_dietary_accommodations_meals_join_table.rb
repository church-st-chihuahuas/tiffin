class AddDietaryAccommodationsMealsJoinTable < ActiveRecord::Migration[5.2]
  def change
    create_table :dietary_accommodations_meals, :id => false do |t|
      t.integer :dietary_accommodation_id
      t.integer :meal_id
    end
  end
end
