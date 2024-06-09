class CreateExecutiveTable < ActiveRecord::Migration[7.1]
  def change
    create_table :executives do |t|
      t.string :role

      t.timestamps
    end
  end
end
