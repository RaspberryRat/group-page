class UpdateSubNameColumnInSubgroups < ActiveRecord::Migration[7.1]
  def change
    remove_column :subgroups, :sub_name
    add_column :subgroups, :name, :string
  end
end
