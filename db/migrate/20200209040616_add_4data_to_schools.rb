class Add4dataToSchools < ActiveRecord::Migration[5.2]
  def change
    add_column :schools, :chief, :integer
    add_column :schools, :security, :integer
    add_column :schools, :staff, :integer
    add_column :schools, :supervision, :integer
  end
end
