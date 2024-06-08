class AddApproveToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :approve, :boolean, null: false, default: false
  end
end
