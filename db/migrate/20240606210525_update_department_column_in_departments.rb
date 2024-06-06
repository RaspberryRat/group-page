class UpdateDepartmentColumnInDepartments < ActiveRecord::Migration[7.1]
  def change
    remove_column :departments, :department
    add_column :departments, :name, :string
  end
end
