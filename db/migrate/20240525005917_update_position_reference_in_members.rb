class UpdatePositionReferenceInMembers < ActiveRecord::Migration[7.1]
  def change
    remove_reference :members, :position
    add_reference :members, :position, null: true, foreign_key: true
  end
end
