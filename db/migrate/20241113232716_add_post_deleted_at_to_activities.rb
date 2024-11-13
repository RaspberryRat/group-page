class AddPostDeletedAtToActivities < ActiveRecord::Migration[7.1]
  def change
    add_column :activities, :post_deleted_at, :datetime
  end
end
