class ChangeSubgroupAttributeToTableReferenceInMembers < ActiveRecord::Migration[7.1]
  def change
    remove_column :members, :subgroup
    add_reference :members, :subgroup, foreign_key: true, null: true

  end
end
