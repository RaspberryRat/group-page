class ChangeTitleToNameInEvents < ActiveRecord::Migration[7.1]
  def change
    rename_column :events, :title, :name
  end
end
