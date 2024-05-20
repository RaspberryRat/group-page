class AddOrganizerColumnToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :organizer, :boolean, default: false
      end
end
