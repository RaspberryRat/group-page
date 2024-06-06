class UpdateSubgroupTable < ActiveRecord::Migration[7.1]
  def change
    rename_column :subgroups, :subgroup, :sub_name
  end
end
