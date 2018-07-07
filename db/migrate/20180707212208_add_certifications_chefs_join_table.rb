class AddCertificationsChefsJoinTable < ActiveRecord::Migration[5.2]
  def change
    create_table :certifications_chefs, :id => false do |t|
      t.integer :certification_id
      t.integer :chef_id
    end
  end
end
