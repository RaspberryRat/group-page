class UpdateClassifiCationTableName < ActiveRecord::Migration[7.1]
  def change
    remove_column :classifications, :classification
    add_column :classifications, :class, :string
  end
end
