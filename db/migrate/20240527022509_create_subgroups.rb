class CreateSubgroups < ActiveRecord::Migration[7.1]
  def change
    create_table :subgroups do |t|
      t.string :subgroup

      t.timestamps
    end
  end
end
