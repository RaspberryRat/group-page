class AddPositionReferenceToMembers < ActiveRecord::Migration[7.1]
  def change
    add_reference :members, :position, foreign_key: true, null: false

  end
end
