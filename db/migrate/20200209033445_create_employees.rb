class CreateEmployees < ActiveRecord::Migration[5.2]
  def change
    create_table :employees do |t|
      t.string :name        #社員の名前
      t.string :password    #社員のパスワード

      t.timestamps
    end
  end
end
