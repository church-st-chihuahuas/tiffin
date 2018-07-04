class RenameZipToZipCode < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :zip, :zip_code
  end
end
