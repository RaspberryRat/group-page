class AddSuperAdminRoleToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :super_user, :boolean, default: false, null: false
  end
end
