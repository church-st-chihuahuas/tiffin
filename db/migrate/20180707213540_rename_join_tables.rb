class RenameJoinTables < ActiveRecord::Migration[5.2]
  def change
    rename_table :dietary_accommodations_chefs, :chefs_dietary_accommodations
    rename_table :cuisines_chefs, :chefs_cuisines
  end
end