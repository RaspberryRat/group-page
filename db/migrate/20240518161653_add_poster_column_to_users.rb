class AddPosterColumnToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :poster, :boolean, default: false
  end
end
