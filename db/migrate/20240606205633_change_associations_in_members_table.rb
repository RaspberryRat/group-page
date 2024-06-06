class ChangeAssociationsInMembersTable < ActiveRecord::Migration[7.1]
  def change
    remove_column :members, :position_id
    remove_column :members, :region_id
    remove_column :members, :department_id
    remove_column :members, :classification_id


    add_reference :members, :position, foreign_key: true
    add_reference :members, :region, foreign_key: true
    add_reference :members, :department, foreign_key: true
    add_reference :members, :classification, foreign_key: true
  end
end
