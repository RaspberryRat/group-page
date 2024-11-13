class UpdateTimeStapColumnToTimeStamp < ActiveRecord::Migration[7.1]
  def change
    rename_column :activities, :timestap, :timestamp
  end
end
