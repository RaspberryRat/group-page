class ChangeAttributesToTableRefrencesInMembers < ActiveRecord::Migration[7.1]
  def change
    remove_column :members, :department
    remove_column :members, :region
    remove_column :members, :classification
    add_reference :members, :department, foreign_key: true, null: true
    add_reference :members, :region, foreign_key: true, null: true
    add_reference :members, :classification, foreign_key: true, null: true


  end
end
