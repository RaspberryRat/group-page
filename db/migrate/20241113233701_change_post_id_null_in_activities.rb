class ChangePostIdNullInActivities < ActiveRecord::Migration[7.1]
  def change
    change_column_null :activities, :post_id, true
  end
end
