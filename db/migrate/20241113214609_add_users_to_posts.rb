class AddUsersToPosts < ActiveRecord::Migration[7.1]
  def change
    # Add the user_id column without null constraint
    add_reference :posts, :user, foreign_key: true

    # Update existing posts to have a valid user_id
    Post.update_all(user_id: 1) # Make sure to update with an appropriate user_id

    # Now set the null constraint
    change_column_null :posts, :user_id, false
  end
end
