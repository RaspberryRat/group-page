class CreateClassifications < ActiveRecord::Migration[7.1]
  def change
    create_table :classifications do |t|
      t.string :classification

      t.timestamps
    end
  end
end
