class AddBargainingToMembers < ActiveRecord::Migration[7.1]
  def change
    add_column :members, :bargaining, :boolean, null: false, default: false
  end
end
