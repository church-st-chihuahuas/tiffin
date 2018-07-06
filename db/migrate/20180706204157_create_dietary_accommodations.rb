class CreateDietaryAccommodations < ActiveRecord::Migration[5.2]
  def change
    create_table :dietary_accommodations do |t|
      t.string 'name'
      t.timestamps
    end
  end
end
