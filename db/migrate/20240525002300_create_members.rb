class CreateMembers < ActiveRecord::Migration[7.1]
  def change
    create_table :members do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :region
      t.string :phone_number
      t.string :department
      t.string :classification
      t.string :subgroup
      t.boolean :steward

      t.timestamps
    end
  end
end
