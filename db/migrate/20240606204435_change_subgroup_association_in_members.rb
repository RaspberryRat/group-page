class ChangeSubgroupAssociationInMembers < ActiveRecord::Migration[7.1]
  def change
    remove_column :members, :subgroup_id
    add_reference :members, :subgroup, foreign_key: true
  end
end
