class CreateTestkais < ActiveRecord::Migration[5.2]
  def change
    create_table :testkais do |t|
      t.string :kai
      t.integer :year
      t.integer :month
      t.integer :day
      
      t.timestamps
    end
  end
end
