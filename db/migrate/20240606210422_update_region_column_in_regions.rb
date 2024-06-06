class UpdateRegionColumnInRegions < ActiveRecord::Migration[7.1]
  def change
    remove_column :regions, :region
    add_column :regions, :name, :string
  end
end
