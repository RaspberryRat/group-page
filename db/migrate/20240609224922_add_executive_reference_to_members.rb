class AddExecutiveReferenceToMembers < ActiveRecord::Migration[7.1]
  def change
    add_reference :members, :executive, foreign_key: true
  end
end
